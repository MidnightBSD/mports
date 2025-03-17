PORTNAME=	amazon-ssm-agent
PORTVERSION=	3.3.1957.0
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Amazon Simple Systems Manager Agent
WWW=		https://github.com/aws/amazon-ssm-agent

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss

USES=		go:1.22

USE_GITHUB=	yes
GH_ACCOUNT=	aws
GH_SUBDIR=	src/github.com/aws/amazon-ssm-agent

GO_BUILDFLAGS=	-ldflags "-s -w"
GO_ENV+=	GOOS=freebsd
GO_TARGET=	./agent:${PREFIX}/sbin/amazon-ssm-agent \
		./agent/framework/processor/executer/outofproc/worker:${PREFIX}/sbin/ssm-document-worker \
		./agent/framework/processor/executer/outofproc/sessionworker:${PREFIX}/sbin/ssm-session-worker \
		./agent/session/logging:${PREFIX}/sbin/ssm-session-logger \
		./agent/cli-main:${PREFIX}/sbin/ssm-cli \
		./agent/setupcli:${PREFIX}/sbin/ssm-setup-cli

USE_RC_SUBR=	amazon-ssm-agent

NO_TEST=	yes

post-patch:
	${LN} -s ${WRKSRC}/vendor/src/* ${WRKSRC}/vendor/

pre-build:
# set package version
	cd ${GO_WRKSRC} && BRAZIL_PACKAGE_VERSION=${PORTVERSION} \
	${SETENV} ${MAKE_ENV} ${GO_ENV} ${GO_CMD} run ./agent/version/versiongenerator/version-gen.go

post-build:
	cd ${WRKDIR}/src/github.com/aws/amazon-ssm-agent && \
		GOOS=freebsd GOARCH=amd64 ${GO_CMD} build ${GO_BUILDFLAGS} -o ${WRKDIR}/bin/ssm-agent-worker -v agent/agent.go agent/agent_unix.go agent/agent_parser.go

post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/etc/amazon/ssm
	${INSTALL_DATA} ${WRKSRC}/amazon-ssm-agent.json.template ${STAGEDIR}${PREFIX}/etc/amazon/ssm
	${INSTALL_DATA} ${WRKSRC}/seelog_unix.xml ${STAGEDIR}${PREFIX}/etc/amazon/ssm/seelog_unix.xml.template
	${CP} ${WRKDIR}/bin/ssm-agent-worker ${PREFIX}/bin/ssm-agent-worker

.include <bsd.port.mk>
