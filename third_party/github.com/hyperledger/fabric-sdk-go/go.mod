module github.com/hyperledger/fabric-sdk-go

go 1.13

replace github.com/tjfoc/gmsm v1.4.0 => ./third_party/github.com/tjfoc/gmsm

replace github.com/tjfoc/gmtls v1.2.1 => ./third_party/github.com/tjfoc/gmtls

//replace github.com/go-kit/kit v0.10.0 => github.com/go-kit/kit v0.8.0

//replace github.com/cloudflare/cfssl v1.5.0 => github.com/cloudflare/cfssl v0.0.0-20180223231731-4e2dcbde5004

replace github.com/golang/protobuf v1.5.2 => github.com/golang/protobuf v1.3.3

replace google.golang.org/grpc v1.37.0 => google.golang.org/grpc v1.11.3

require (
	github.com/Knetic/govaluate v3.0.0+incompatible
	github.com/cloudflare/cfssl v0.0.0-20180223231731-4e2dcbde5004
	github.com/fsouza/go-dockerclient v1.7.4 // indirect
	github.com/go-kit/kit v0.9.0
	github.com/golang/mock v1.4.1
	github.com/golang/protobuf v1.5.2
	github.com/google/certificate-transparency-go v1.0.10-0.20180222191210-5ab67e519c93 // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.3.0 // indirect
	github.com/hyperledger/fabric v1.4.7
	github.com/hyperledger/fabric-amcl v0.0.0-20210603140002-2670f91851c8 // indirect
	github.com/hyperledger/fabric-lib-go v1.0.0
	github.com/miekg/pkcs11 v1.0.3
	github.com/mitchellh/mapstructure v1.1.2
	github.com/onsi/ginkgo v1.16.1
	github.com/onsi/gomega v1.11.0
	github.com/op/go-logging v0.0.0-20160315200505-970db520ece7
	github.com/pkg/errors v0.9.1
	github.com/prometheus/client_golang v1.7.1
	github.com/spf13/cast v1.3.0
	github.com/spf13/viper v1.4.0
	github.com/stretchr/testify v1.6.1
	github.com/sykesm/zap-logfmt v0.0.4
	github.com/thedevsaddam/gojsonq v2.3.0+incompatible
	github.com/tjfoc/gmsm v1.4.0
	github.com/tjfoc/gmtls v1.2.1
	go.uber.org/zap v1.16.0
	golang.org/x/crypto v0.0.0-20210322153248-0c34fe9e7dc2
	golang.org/x/net v0.0.0-20210924054057-cf34111cab4d
	google.golang.org/grpc v1.40.0

)
