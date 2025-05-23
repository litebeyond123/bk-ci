module github.com/TencentBlueKing/bk-ci/agent

go 1.19

require (
	github.com/TencentBlueKing/bk-ci/agentcommon v0.0.0-00010101000000-000000000000
	github.com/docker/docker v24.0.9+incompatible
	github.com/gofrs/flock v0.8.1
	// 1.24 以上的版本引入了memcall和memguard会导致
	// 1、ulimit corefile被设置为0 https://github.com/ci-plugins/memguard/blob/master/core/init.go
	// 2、arm64 linux panic报错 https://github.com/awnumar/memguard/issues/144
	github.com/influxdata/telegraf v1.24.4
	github.com/nicksnyder/go-i18n/v2 v2.2.1
	github.com/pkg/errors v0.9.1
	github.com/sirupsen/logrus v1.9.3
	golang.org/x/text v0.21.0
	gopkg.in/ini.v1 v1.67.0
	gopkg.in/natefinch/lumberjack.v2 v2.2.1 // indirect
	gotest.tools/v3 v3.5.0
)

require (
	github.com/Microsoft/go-winio v0.6.0 // indirect
	github.com/alecthomas/participle v0.4.1 // indirect
	github.com/alecthomas/units v0.0.0-20211218093645-b94a6e3cc137 // indirect
	github.com/benbjohnson/clock v1.3.0 // indirect
	github.com/coreos/go-semver v0.3.1 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/docker/go-units v0.5.0 // indirect
	github.com/fatih/color v1.13.0 // indirect
	github.com/go-ole/go-ole v1.2.6 // indirect
	github.com/gobwas/glob v0.2.3 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/golang/protobuf v1.5.3 // indirect
	github.com/golang/snappy v0.0.4 // indirect
	github.com/google/go-cmp v0.6.0 // indirect
	github.com/gosnmp/gosnmp v1.35.0 // indirect
	github.com/imdario/mergo v0.3.12 // indirect
	github.com/influxdata/toml v0.0.0-20190415235208-270119a8ce65 // indirect
	github.com/influxdata/wlog v0.0.0-20160411224016-7c63b0a71ef8 // indirect
	github.com/lufia/plan9stats v0.0.0-20220913051719-115f729f3c8c // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-isatty v0.0.16 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.4 // indirect
	github.com/mitchellh/mapstructure v1.5.0 // indirect
	github.com/naoina/go-stringutil v0.1.0 // indirect
	github.com/opencontainers/go-digest v1.0.0 // indirect
	github.com/opencontainers/image-spec v1.1.0-rc2.0.20221005185240-3a7f492d3f1b // indirect
	github.com/philhofer/fwd v1.1.1 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/power-devops/perfstat v0.0.0-20220216144756-c35f1ee13d7c // indirect
	github.com/prometheus/client_model v0.3.0 // indirect
	github.com/prometheus/common v0.39.0 // indirect
	github.com/prometheus/prometheus v1.8.2-0.20210430082741-2a4b8e12bbf2 // indirect
	github.com/rogpeppe/go-internal v1.6.2 // indirect
	// 1.24 telegraf 必须跟随 3.22.9 版本，之上的版本windows编译不通过
	github.com/shirou/gopsutil/v3 v3.22.9 // indirect
	github.com/sleepinggenius2/gosmi v0.4.4 // indirect
	github.com/stretchr/objx v0.5.2 // indirect
	github.com/stretchr/testify v1.9.0 // indirect
	github.com/tinylib/msgp v1.1.6 // indirect
	github.com/tklauser/go-sysconf v0.3.12 // indirect
	github.com/tklauser/numcpus v0.6.1 // indirect
	github.com/xeipuuv/gojsonpointer v0.0.0-20180127040702-4e3ac2762d5f // indirect
	github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415 // indirect
	github.com/yusufpapurcu/wmi v1.2.4 // indirect
	golang.org/x/net v0.25.0 // indirect
	golang.org/x/sys v0.28.0
	google.golang.org/protobuf v1.33.0 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

require (
	github.com/fsouza/go-dockerclient v1.9.7
	github.com/gorilla/websocket v1.5.0
	golang.org/x/sync v0.10.0
)

require (
	cloud.google.com/go v0.110.4 // indirect
	cloud.google.com/go/bigquery v1.52.0 // indirect
	cloud.google.com/go/compute v1.21.0 // indirect
	cloud.google.com/go/compute/metadata v0.2.3 // indirect
	cloud.google.com/go/iam v1.1.1 // indirect
	cloud.google.com/go/monitoring v1.15.1 // indirect
	cloud.google.com/go/pubsub v1.32.0 // indirect
	github.com/Azure/go-ansiterm v0.0.0-20210617225240-d185dfc1b5a1 // indirect
	github.com/aws/aws-sdk-go-v2 v1.17.1 // indirect
	github.com/aws/aws-sdk-go-v2/config v1.17.8 // indirect
	github.com/aws/aws-sdk-go-v2/credentials v1.13.2 // indirect
	github.com/aws/aws-sdk-go-v2/feature/ec2/imds v1.12.19 // indirect
	github.com/aws/aws-sdk-go-v2/internal/configsources v1.1.25 // indirect
	github.com/aws/aws-sdk-go-v2/internal/endpoints/v2 v2.4.19 // indirect
	github.com/aws/aws-sdk-go-v2/internal/ini v1.3.24 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/presigned-url v1.9.19 // indirect
	github.com/aws/aws-sdk-go-v2/service/sso v1.11.25 // indirect
	github.com/aws/aws-sdk-go-v2/service/ssooidc v1.13.8 // indirect
	github.com/aws/aws-sdk-go-v2/service/sts v1.17.4 // indirect
	github.com/aws/smithy-go v1.13.4 // indirect
	github.com/blues/jsonata-go v1.5.4 // indirect
	github.com/containerd/containerd v1.6.26 // indirect
	github.com/docker/distribution v2.8.2+incompatible // indirect
	github.com/go-logr/logr v1.4.1 // indirect
	github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da // indirect
	github.com/google/s2a-go v0.1.4 // indirect
	github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510 // indirect
	github.com/googleapis/enterprise-certificate-proxy v0.2.3 // indirect
	github.com/klauspost/compress v1.15.11 // indirect
	github.com/kr/pretty v0.3.0 // indirect
	github.com/moby/patternmatcher v0.5.0 // indirect
	github.com/moby/sys/sequential v0.5.0 // indirect
	github.com/moby/term v0.0.0-20210619224110-3f7ff695adc6 // indirect
	github.com/morikuni/aec v1.0.0 // indirect
	github.com/opencontainers/runc v1.1.14 // indirect
	github.com/rickb777/date v1.14.2 // indirect
	github.com/rickb777/plural v1.2.2 // indirect
	github.com/shoenig/go-m1cpu v0.1.6 // indirect
	github.com/xeipuuv/gojsonschema v1.2.0 // indirect
	go.opencensus.io v0.24.0 // indirect
	golang.org/x/crypto v0.31.0 // indirect
	golang.org/x/mod v0.17.0 // indirect
	golang.org/x/oauth2 v0.10.0 // indirect
	golang.org/x/tools v0.21.1-0.20240508182429-e35e4ccd0d2d // indirect
	google.golang.org/api v0.126.0 // indirect
	google.golang.org/appengine v1.6.7 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20230711160842-782d3b101e98 // indirect
	google.golang.org/grpc v1.58.3 // indirect
)

require (
	// 非稳定库，目前只在windows升级中简单使用且主要做对go-ole的封装简化，大规模使用前需要评估
	github.com/capnspacehook/taskmaster v0.0.0-20210519235353-1629df7c85e9
	github.com/docker/cli v23.0.1+incompatible
	github.com/docker/go-connections v0.4.0
	github.com/kardianos/service v1.2.2
	github.com/shirou/gopsutil/v4 v4.24.5
	github.com/spf13/pflag v1.0.5
)

replace github.com/TencentBlueKing/bk-ci/agentcommon => ../common
