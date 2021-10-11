package factory

import (
	"fmt"
	"github.com/hyperledger/fabric-sdk-go/third_party/github.com/hyperledger/fabric/bccsp"
	"github.com/hyperledger/fabric-sdk-go/third_party/github.com/hyperledger/fabric/bccsp/cncc"
	"github.com/pkg/errors"
)

var (
	// BCCSP Factories
	bccspMap map[string]bccsp.BCCSP
)

const (
	// CNCC_GM BasedFactoryName is the name of the factory of the hsm-based BCCSP implementation
	CNCC_GMBasedFactoryName = "CNCC_GM"
)

// CNCC_GMFactory is the factory of the HSM-based BCCSP.
type CNCC_GMFactory struct{}

// Name returns the name of this factory
func (f *CNCC_GMFactory) Name() string {
	return CNCC_GMBasedFactoryName
}

// Get returns an instance of BCCSP using Opts.
func (f *CNCC_GMFactory) Get(gmOpts *cncc.CNCC_GMOpts) (bccsp.BCCSP, error) {
	// Validate arguments
	if gmOpts == nil {
		return nil, errors.New("Invalid config. It must not be nil.")
	}

	var ks bccsp.KeyStore
	switch {
	case gmOpts.Ephemeral:
		ks = cncc.NewDummyKeyStore()
	case gmOpts.FileKeystore != nil:
		fks, err := cncc.NewFileBasedKeyStore(nil, gmOpts.FileKeystore.KeyStorePath, false)
		if err != nil {
			return nil, fmt.Errorf("Failed to initialize software key store: %s", err)
		}
		ks = fks
	default:
		// Default to ephemeral key store
		ks = cncc.NewDummyKeyStore()
	}

	return cncc.New(*gmOpts, ks)
}

// GetBCCSP returns a BCCSP created according to the options passed in input.
func GetBCCSP(name string) (bccsp.BCCSP, error) {
	csp, ok := bccspMap[name]
	if !ok {
		return nil, errors.Errorf("Could not find BCCSP, no '%s' provider", name)
	}
	return csp, nil
}
func SetBCCSP(name string, csp bccsp.BCCSP) {
	bccspMap = make(map[string]bccsp.BCCSP)
	bccspMap[name] = csp
}
