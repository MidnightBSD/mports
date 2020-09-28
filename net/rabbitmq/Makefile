PORTNAME=	rabbitmq
DISTVERSION=	3.8.3
PORTREVISION=	0
CATEGORIES=	net
MASTER_SITES=	https://github.com/rabbitmq/rabbitmq-server/releases/download/v${PORTVERSION}/
DISTNAME=	${PORTNAME}-server-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RabbitMQ is an implementation of AMQP

LICENSE=	mpl
LICENSE_FILE=	${WRKSRC}/LICENSE-MPL-RabbitMQ

BUILD_DEPENDS=	erlang-runtime21>=21.3:lang/erlang-runtime21 \
		elixir>=1.10:lang/elixir \
		${PYTHON_PKGNAMEPREFIX}simplejson>=2.0:devel/py-simplejson@${PY_FLAVOR} \
		xmlto:textproc/xmlto \
		zip:archivers/zip \
		rsync:net/rsync
RUN_DEPENDS=	erlang-runtime21>=21.3:lang/erlang-runtime21

USES=		cpe gmake shebangfix tar:xz
USE_LOCALE=	en_US.UTF-8
USE_RC_SUBR=	rabbitmq
NO_ARCH=	yes

OPTIONS_DEFINE=	ADMIN
OPTIONS_SUB=	yes

ADMIN_DESC=	Install rabbitmqadmin script
ADMIN_USES=	python
ADMIN_USES_OFF=	python:build

ALL_TARGET=	install

USERS=		rabbitmq
GROUPS=		rabbitmq

PLIST_SUB=	VERSION=${PORTVERSION}

CPE_VENDOR=	pivotal_software

FAKE_OPTS=	trueprefix
REINPLACE_ARGS=	-i ""
SCRIPTS_DIR=	${WRKSRC}/deps/rabbit/scripts
SHEBANG_FILES=	deps/rabbitmq_management/bin/rabbitmqadmin
MAKE_ARGS+=	PYTHON=${PYTHON_CMD}
MAKE_ENV+=	PATH="${LOCALBASE}/lib/erlang21/bin:${PATH}" \
		RMQ_LIBDIR="${PREFIX}/lib" \
		MANDIR="${PREFIX}/man" \
		DESTDIR="${FAKE_DESTDIR}"

MAKE_JOBS_UNSAFE=	yes

ERLANG_LIB=	erlang21

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|/etc/rabbitmq|${PREFIX}/etc/rabbitmq|g ; s|/var/lib|/var/db|g ; s|$${ERL_DIR}erl|${PREFIX}/lib/${ERLANG_LIB}/bin/erl|g' \
		${SCRIPTS_DIR}/rabbitmq-server \
		${SCRIPTS_DIR}/rabbitmqctl \
		${SCRIPTS_DIR}/rabbitmq-env \
		${SCRIPTS_DIR}/rabbitmq-plugins \
		${SCRIPTS_DIR}/rabbitmq-defaults \
		${WRKSRC}/deps/rabbit/docs/rabbitmq-env.conf.5

post-install:
	@${MKDIR} {PREFIX}/etc/rabbitmq
	@${MKDIR} ${FAKE_DESTDIR}/var/db/rabbitmq/mnesia
	@${MKDIR} ${FAKE_DESTDIR}/var/log/rabbitmq
	${INSTALL_DATA} ${WRKSRC}/deps/rabbit/docs/advanced.config.example \
	${PREFIX}/etc/rabbitmq/advanced.config.sample
	${INSTALL_DATA} ${WRKSRC}/deps/rabbit/docs/rabbitmq.conf.example \
	${PREFIX}/etc/rabbitmq/rabbitmq.conf.sample
.for _file in cuttlefish rabbitmq-defaults rabbitmq-diagnostics rabbitmq-env rabbitmq-plugins rabbitmq-server rabbitmq-upgrade rabbitmqctl
	${LN} -s ../lib/rabbitmq_server-${PORTVERSION}/sbin/${_file} ${STAGEDIR}${PREFIX}/sbin
.endfor
	${INSTALL_MAN} ${WRKSRC}/deps/rabbit/docs/*.8  ${STAGEDIR}${MAN1PREFIX}/man/man8
	${INSTALL_MAN} ${WRKSRC}/deps/rabbit/docs/rabbitmq-env.conf.5 ${STAGEDIR}${MAN5PREFIX}/man/man5

post-install-ADMIN-on:
	${INSTALL} ${WRKSRC}/deps/rabbitmq_management/bin/rabbitmqadmin ${FAKE_DESTDIR}${PREFIX}/bin

.include <bsd.port.mk>
