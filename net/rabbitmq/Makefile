# $FreeBSD: head/net/rabbitmq/Makefile 393196 2015-07-29 22:09:53Z antoine $
# $MidnightBSD$

PORTNAME=	rabbitmq
PORTVERSION=	3.6.6
CATEGORIES=	net
MASTER_SITES=	http://www.rabbitmq.com/releases/rabbitmq-server/v${PORTVERSION}/
DISTNAME=	${PORTNAME}-server-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RabbitMQ is an implementation of AMQP

LICENSE=	mpl

BUILD_DEPENDS=	erl:lang/erlang \
		${PYTHON_PKGNAMEPREFIX}simplejson>=2.0:devel/py-simplejson@${PY_FLAVOR} \
		xmlto:textproc/xmlto \
		zip:archivers/zip \
		rsync:net/rsync
RUN_DEPENDS=	erl:lang/erlang

OPTIONS_DEFINE=	ADMIN
OPTIONS_SUB=	yes

ADMIN_DESC=	Install rabbitmqadmin script

ALL_TARGET=	all manpages
USES=		cpe gmake python:build tar:xz
USE_RC_SUBR=	rabbitmq
NO_ARCH=	yes

USERS=		rabbitmq
GROUPS=		rabbitmq

PLIST_SUB+=	VERSION=${PORTVERSION}

CPE_VENDOR=	pivotal_software

FAKE_OPTS=	trueprefix
REINPLACE_ARGS=	-i ""
SCRIPTS_DIR=	${WRKSRC}/deps/rabbit/scripts
MAKE_ARGS+=	PYTHON=${PYTHON_CMD}
MAKE_ENV+=	TARGET_DIR="${FAKE_DESTDIR}${TRUE_PREFIX}/lib/erlang/lib/rabbitmq_server-${PORTVERSION}" \
		SBIN_DIR="${FAKE_DESTDIR}${TRUE_PREFIX}/sbin/" \
		MAN_DIR="${FAKE_DESTDIR}${TRUE_PREFIX}/man" \
		DOC_INSTALL_DIR="${FAKE_DESTDIR}${EXAMPLESDIR}" \
		VERSION="${PORTVERSION}"

MAKE_JOBS_UNSAFE=	yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MADMIN}
USES+=		python:run
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/etc/rabbitmq|${PREFIX}/etc/rabbitmq|g ; s|/var/lib|/var/db|g ; s|$${ERL_DIR}erl|${PREFIX}/bin/erl|g' \
		${SCRIPTS_DIR}/rabbitmq-server \
		${SCRIPTS_DIR}/rabbitmqctl \
		${SCRIPTS_DIR}/rabbitmq-env \
		${SCRIPTS_DIR}/rabbitmq-plugins \
		${SCRIPTS_DIR}/rabbitmq-defaults \
		${WRKSRC}/deps/rabbit/docs/rabbitmq-env.conf.5.xml

post-install:
	@${MKDIR} ${PREFIX}/etc/rabbitmq
	@${MKDIR} ${FAKE_DESTDIR}/var/db/rabbitmq/mnesia
	@${MKDIR} ${FAKE_DESTDIR}/var/log/rabbitmq
	${INSTALL_DATA} ${WRKSRC}/deps/rabbit/docs/rabbitmq.config.example \
		${PREFIX}/etc/rabbitmq/rabbitmq.config.sample
.for _file in rabbitmq-defaults rabbitmq-env rabbitmq-plugins rabbitmq-server rabbitmqctl
	${LN} -s ../lib/erlang/lib/rabbitmq_server-${PORTVERSION}/sbin/${_file} ${PREFIX}/sbin
.endfor
.for _file in rabbitmq-plugins.1 rabbitmq-server.1 rabbitmqctl.1
	${INSTALL_MAN} ${WRKSRC}/deps/rabbit/docs/${_file} ${STAGEDIR}${MAN1PREFIX}/man/man1
.endfor
	${INSTALL_MAN} ${WRKSRC}/deps/rabbit/docs/rabbitmq-env.conf.5 ${MAN5PREFIX}/man/man5
	${INSTALL} ${WRKSRC}/deps/rabbitmq_management/bin/rabbitmqadmin ${PREFIX}/bin

.include <bsd.port.mk>
