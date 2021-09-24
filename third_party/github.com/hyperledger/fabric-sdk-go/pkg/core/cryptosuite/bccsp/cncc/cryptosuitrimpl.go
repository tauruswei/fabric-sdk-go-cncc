package cncc

/**
 * @Author: WeiBingtao/13156050650@163.com
 * @Version: 1.0
 * @Description:
 * @Date: 2020/10/9 下午3:04
 */
import (
	"github.com/hyperledger/fabric-sdk-go/pkg/common/logging"
	"github.com/hyperledger/fabric-sdk-go/pkg/common/providers/core"
	"github.com/hyperledger/fabric-sdk-go/pkg/core/cryptosuite/bccsp/wrapper"
	"github.com/hyperledger/fabric-sdk-go/third_party/github.com/hyperledger/fabric/bccsp"
	"github.com/hyperledger/fabric-sdk-go/third_party/github.com/hyperledger/fabric/bccsp/cncc"
	bccspSw "github.com/hyperledger/fabric-sdk-go/third_party/github.com/hyperledger/fabric/bccsp/factory/cncc"
	//originBccsp "github.com/hyperledger/fabric/bccsp"
	//"github.com/hyperledger/fabric/bccsp/factory"
	"github.com/pkg/errors"
	"strings"
)

var logger = logging.NewLogger("fabsdk/core")

//GetSuiteByConfig returns cryptosuite adaptor for bccsp loaded according to given config
func GetSuiteByConfig(config core.CryptoSuiteConfig) (core.CryptoSuite, error) {
	// TODO: delete this check?
	if config.SecurityProvider() != "cncc_gm" {
		return nil, errors.Errorf("Unsupported BCCSP Provider: %s", config.SecurityProvider())
	}

	opts := getOptsByConfig(config)
	csp, err := getBCCSPFromOpts(opts)
	bccspSw.SetBCCSP(strings.ToUpper(config.SecurityProvider()), csp)
	if err != nil {
		return nil, err
	}
	return wrapper.NewCryptoSuite(csp), nil
}

//GetSuiteWithDefaultEphemeral returns cryptosuite adaptor for bccsp with default ephemeral options (intended to aid testing)
func GetSuiteWithDefaultEphemeral() (core.CryptoSuite, error) {
	opts := getEphemeralOpts()

	bccsp, err := getBCCSPFromOpts(opts)
	if err != nil {
		return nil, err
	}
	return wrapper.NewCryptoSuite(bccsp), nil
}

func getBCCSPFromOpts(config *cncc.CNCC_GMOpts) (bccsp.BCCSP, error) {
	f := &bccspSw.CNCC_GMFactory{}

	csp, err := f.Get(config)
	if err != nil {
		return nil, errors.Wrapf(err, "Could not initialize BCCSP %s", f.Name())
	}
	return csp, nil
}

// GetSuite returns a new instance of the software-based BCCSP
// set at the passed security level, hash family and KeyStore.
//func GetSuite(securityLevel int, hashFamily string, keyStore bccsp.KeyStore) (core.CryptoSuite, error) {
//	bccsp, err := gm.New(securityLevel, hashFamily, keyStore)
//	if err != nil {
//		return nil, err
//	}
//	return wrapper.NewCryptoSuite(bccsp), nil
//}

//GetOptsByConfig Returns Factory opts for given SDK config
func getOptsByConfig(c core.CryptoSuiteConfig) *cncc.CNCC_GMOpts {
	opts := &cncc.CNCC_GMOpts{
		HashFamily: c.SecurityAlgorithm(),
		SecLevel:   c.SecurityLevel(),
		FileKeystore: &cncc.FileKeystoreOpts{
			KeyStorePath: c.KeyStorePath(),
		},
		//Ephemeral: c.Ephemeral(),
	}
	logger.Debugf("Initialized CNCC_GM cryptosuite, %v", c.SecurityAlgorithm())

	return opts
}

func getEphemeralOpts() *cncc.CNCC_GMOpts {
	opts := &cncc.CNCC_GMOpts{
		HashFamily: "GMSM3",
		SecLevel:   256,
		Ephemeral:  true,
	}
	logger.Debug("Initialized ephemeral CNCC_GM cryptosuite with default opts")

	return opts
}
