# Created by: Phillip Neumann <pneumann@gmail.com>
# $FreeBSD: head/net/rabbitmq/Makefile 393196 2015-07-29 22:09:53Z antoine $
# $MidnightBSD$

PORTNAME=	rabbitmq
PORTVERSION=	3.5.4
CATEGORIES=	net
MASTER_SITES=	http://www.rabbitmq.com/releases/rabbitmq-server/v${PORTVERSION}/
DISTNAME=	${PORTNAME}-server-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RabbitMQ is an implementation of AMQP

LICENSE=	mpl

BUILD_DEPENDS=	erl:${PORTSDIR}/lang/erlang \
		${PYTHON_PKGNAMEPREFIX}simplejson>=2.0:${PORTSDIR}/devel/py-simplejson \
		xmlto:${PORTSDIR}/textproc/xmlto \
		unzip:${PORTSDIR}/archivers/unzip \
		zip:${PORTSDIR}/archivers/zip
RUN_DEPENDS=	erl:${PORTSDIR}/lang/erlang

OPTIONS_DEFINE=	ADMIN
OPTIONS_SUB=	yes

ADMIN_DESC=	Install rabbitmqadmin script

USES=		cpe gmake python:build shebangfix
USE_RC_SUBR=	rabbitmq
SHEBANG_FILES=	calculate-relative plugins-src/rabbitmq-amqp1.0/codegen.py
python_OLD_CMD=	.*python

USERS=		rabbitmq
GROUPS=		rabbitmq

PLIST_SUB=	VERSION=${PORTVERSION}

CPE_VENDOR=	pivotal_software

SCRIPTS_DIR=	${WRKSRC}/scripts/
MAKE_ARGS+=	PYTHON=${PYTHON_CMD}
MAKE_ENV+=	TARGET_DIR="${FAKE_DESTDIR}${TRUE_PREFIX}/lib/erlang/lib/rabbitmq_server-${PORTVERSION}" \
		SBIN_DIR="${FAKE_DESTDIR}${TRUE_PREFIX}/sbin/" \
		MAN_DIR="${FAKE_DESTDIR}${TRUE_PREFIX}/man" \
		DOC_INSTALL_DIR="${FAKE_DESTDIR}${EXAMPLESDIR}"

MAKE_JOBS_UNSAFE=	yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MADMIN}
USES+=		python:run
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/etc/rabbitmq|${PREFIX}/etc/rabbitmq|g ; s|/var/lib|/var/db|g ; s|$${ERL_DIR}erl|${PREFIX}/bin/erl|g' \
		${SCRIPTS_DIR}/rabbitmq-server ${SCRIPTS_DIR}/rabbitmqctl \
		${SCRIPTS_DIR}/rabbitmq-env ${SCRIPTS_DIR}/rabbitmq-plugins \
		${SCRIPTS_DIR}/rabbitmq-defaults \
		${WRKSRC}/docs/rabbitmq-env.conf.5.xml
	@${REINPLACE_CMD} -e 's|VERSION=0.0.0|VERSION=${PORTVERSION}|g' \
		${WRKSRC}/plugins-src/rabbitmq-erlang-client/Makefile \
		${WRKSRC}/plugins-src/release.mk
	@${REINPLACE_CMD} -e 's|VERSION:=0.0.0|VERSION:=${PORTVERSION}|g' \
		${WRKSRC}/plugins-src/Makefile
	@${REINPLACE_CMD} -e 's|VERSION?=0.0.0|VERSION?=${PORTVERSION}|g' \
		${WRKSRC}/Makefile
	@${FIND} ${WRKSRC} -name "*.bak" -delete

post-install:
	@${MKDIR} ${PREFIX}/etc/rabbitmq
	@${MKDIR} ${FAKE_DESTDIR}/var/db/rabbitmq/mnesia
	@${MKDIR} ${FAKE_DESTDIR}/var/log/rabbitmq
	${INSTALL_DATA} ${WRKSRC}/docs/rabbitmq.config.example \
		${PREFIX}/etc/rabbitmq/rabbitmq.config.sample
.if ${PORT_OPTIONS:MADMIN}
	${INSTALL} ${WRKSRC}/plugins-src/rabbitmq-management/bin/rabbitmqadmin ${PREFIX}/bin
.endif

.include <bsd.port.mk>
