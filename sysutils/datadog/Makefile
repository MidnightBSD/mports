PORTNAME=	datadog
PORTVERSION=	5.9.1
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Data Dog agent

LICENSE=	bsd4
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}yaml>=3.11:devel/py-yaml@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}simplejson>=3.6.5:devel/py-simplejson@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}tornado>=3.2.2:www/py-tornado@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}requests>=2.6.0:www/py-requests@${PY_FLAVOR}
RUN_DEPENDS=   	${PYTHON_PKGNAMEPREFIX}yaml>=3.11:devel/py-yaml@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}simplejson>=3.6.5:devel/py-simplejson@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}tornado>=3.2.2:www/py-tornado@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}boto>=2.36.0:devel/py-boto@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}ntplib>=0.3.3:net/py-ntplib@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}requests>=2.6.0:www/py-requests@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}psutil>=2.1.1:sysutils/py-psutil@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}uptime>=3.0.1:sysutils/py-uptime@${PY_FLAVOR}
TEST_DEPENDS:= 	${PYTHON_PKGNAMEPREFIX}mock>=1.0.1:devel/py-mock@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}nose>=1.3.4:devel/py-nose@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}flake8>=2.3.0:devel/py-flake8@${PY_FLAVOR}

USE_GITHUB=	yes
GH_ACCOUNT=	DataDog
GH_PROJECT=	dd-agent

USES=		python:2.7 shebangfix
USE_PYTHON=	autoplist distutils
SHEBANG_FILES=	agent.py ddagent.py dogstatsd.py
python_OLD_CMD=	/opt/datadog-agent/embedded/bin/python

USE_RC_SUBR=   	${PORTNAME}-collector ${PORTNAME}-dogstatsd

RUNDIR?=	/var/run/${PORTNAME}
LOGDIR?=	/var/log/${PORTNAME}

GID_FILES=	${PATCHDIR}/GIDs
UID_FILES=	${PATCHDIR}/UIDs

USERS=		datadog
GROUPS=		${USERS}

SUB_FILES=	pkg-message pkg-deinstall
SUB_LIST=	RUNDIR=${RUNDIR} \
			LOGDIR=${LOGDIR} \
			PYTHON_SITELIBDIR=${PYTHON_SITELIBDIR} \
			PYTHON_CMD=${PYTHON_CMD} \
			USER=${USERS} \
			PORTNAME=${PORTNAME}

PLIST_SUB+=	RUNDIR=${RUNDIR} \
			LOGDIR=${LOGDIR} \
			USER=${USERS} \
			GROUP=${GROUPS} \
			PORTNAME=${PORTNAME}

CONFFILES=	conf.d/*
CHECKFILES=	checks.d/*

PORTDOCS=	README.md CHANGELOG.md CONTRIBUTING.md LICENSE

OPTIONS_DEFINE=	DOCS

post-patch:
		@${REINPLACE_CMD} -e 's|/etc/dd-agent|${ETCDIR}|g' \
			${WRKSRC}/config.py \
			${WRKSRC}/utils/flare.py \
			${WRKSRC}/datadog.conf.example
		@${REINPLACE_CMD} -e 's|%%RUNDIR%%|${RUNDIR}|g' \
			${WRKSRC}/agent.py \
			${WRKSRC}/dogstatsd.py

post-install:
		${MKDIR} ${ETCDIR}/conf.d
		${MKDIR} ${ETCDIR}/checks.d
		${MKDIR} ${FAKE_DESTDIR}${RUNDIR}
		${MKDIR} ${FAKE_DESTDIR}${LOGDIR}
		${MKDIR} ${DOCSDIR}
		${MKDIR} ${EXAMPLESDIR}
		${MKDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/${PORTNAME}/checks.d

.for i in ${CHECKFILES}
		${INSTALL_DATA} ${WRKSRC}/${i} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/${PORTNAME}/checks.d
.endfor

		${INSTALL_DATA} ${WRKSRC}/datadog.conf.example ${ETCDIR}/${PORTNAME}.conf.sample

.for i in ${CONFFILES}
		${INSTALL_DATA} ${WRKSRC}/${i}.example ${EXAMPLESDIR}
		${INSTALL_DATA} ${WRKSRC}/${i}.default ${ETCDIR}/conf.d/
.endfor

.for i in ${PORTDOCS}
		${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor

		${INSTALL_DATA} ${WRKSRC}/datadog-cert.pem ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/${PORTNAME}

regression-test: build
		@cd ${WRKSRC} && ${PYTHON_CMD} ${PYSETUP} test

.include <bsd.port.mk>

