module github.com/tjfoc/gmtls

go 1.13

replace github.com/tjfoc/gmsm v1.4.0 => ../gmsm

require (
	github.com/golang/protobuf v1.5.2
	github.com/tjfoc/gmsm v1.4.0
	golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9
	golang.org/x/net v0.0.0-20210924054057-cf34111cab4d
	google.golang.org/grpc v1.40.0

)
