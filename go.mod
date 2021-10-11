module github.com/hyperledger/fabric-sdk-go-cncc

go 1.13

replace github.com/hyperledger/fabric-sdk-go v1.0.0-alpha5 => ./third_party/github.com/hyperledger/fabric-sdk-go

replace github.com/tjfoc/gmsm v1.4.0 => ./third_party/github.com/hyperledger/fabric-sdk-go/third_party/github.com/tjfoc/gmsm

//replace github.com/tjfoc/gmsm v1.3.2 => ./third_party/github.com/hyperledger/fabric-sdk-go/third_party/github.com/tjfoc/gmsm

replace github.com/tjfoc/gmtls v1.2.1 => ./third_party/github.com/hyperledger/fabric-sdk-go/third_party/github.com/tjfoc/gmtls

replace github.com/go-kit/kit v0.10.0 => github.com/go-kit/kit v0.8.0

replace github.com/cloudflare/cfssl v1.5.0 => github.com/cloudflare/cfssl v0.0.0-20180223231731-4e2dcbde5004

replace github.com/hyperledger/fabric v2.1.1+incompatible => github.com/hyperledger/fabric v1.4.7

replace github.com/golang/protobuf v1.5.2 => github.com/golang/protobuf v1.3.3

replace google.golang.org/genproto v0.0.0-20200707001353-8e8330bf89df => google.golang.org/genproto v0.0.0-20180125080656-4eb30f4778ee

replace google.golang.org/grpc v1.37.0 => google.golang.org/grpc v1.11.3

require (
	github.com/Shopify/sarama v1.27.0 // indirect
	github.com/cloudflare/cfssl v1.5.0 // indirect
	github.com/fastly/go-utils v0.0.0-20180712184237-d95a45783239 // indirect
	github.com/fatih/pool v3.0.0+incompatible // indirect
	github.com/gin-contrib/cors v1.3.1 // indirect
	github.com/gin-gonic/gin v1.6.3 // indirect
	github.com/google/certificate-transparency-go v1.1.1 // indirect
	github.com/hashicorp/go-version v1.2.1 // indirect
	github.com/hyperledger/fabric v1.4.7
	github.com/hyperledger/fabric-protos-go v0.0.0-20210318103044-13fdee960194 // indirect
	github.com/hyperledger/fabric-sdk-go v1.0.0-alpha5
	github.com/ijc/Gotty v0.0.0-20170406111628-a8b993ba6abd // indirect
	github.com/jehiah/go-strftime v0.0.0-20171201141054-1d33003b3869 // indirect
	github.com/lestrrat-go/file-rotatelogs v2.4.0+incompatible // indirect
	github.com/lestrrat-go/strftime v1.0.3 // indirect
	github.com/miekg/dns v1.1.31 // indirect
	github.com/pkg/errors v0.9.1
	github.com/prometheus/prometheus v2.5.0+incompatible // indirect
	github.com/spf13/viper v1.7.1 // indirect
	github.com/tebeka/strftime v0.1.5 // indirect
	gopkg.in/DATA-DOG/go-sqlmock.v1 v1.3.0 // indirect
	gorm.io/driver/mysql v1.0.1 // indirect
	gorm.io/driver/sqlite v1.1.0 // indirect
	gorm.io/gorm v1.20.0 // indirect
	helm.sh/helm/v3 v3.3.0 // indirect
	rsc.io/letsencrypt v0.0.3 // indirect
)
