PORTNAME=	erlang
DISTVERSIONPREFIX=	OTP-
DISTVERSION=	21.3.8.8
# NB when bumping OTP versions also bump PORTREVISION in databases/couchdb2
CATEGORIES=	lang parallel java
PKGNAMESUFFIX=	-runtime21
DIST_SUBDIR=	erlang

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Functional programming language from Ericsson

LICENSE=	apache2

BROKEN_sparc64=	Fails to build: error: fp_except undeclared

USES=		autoreconf:build gmake ncurses perl5
USE_GITHUB=	nodefault
GH_ACCOUNT=	erlang:otp,corba
GH_PROJECT=	otp:otp corba:corba
GH_TAGNAME=	4.5.2:corba
USE_PERL5=	build

DATADIR=        ${PREFIX}/share/${PORTNAME}${PKGNAMESUFFIX}
WRKSRC=		${WRKSRC_otp}

GNU_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=yes

CONFIGURE_ARGS+=	 --without-dynamic-trace
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

SUB_FILES=	pkg-message
SUB_LIST=	ERLANG_LIB=${ERLANG_LIB}

ERLANG_LIB=	${PORTNAME}${PORTVERSION:C/\..*//}

OPTIONS_DEFINE=	CORBA DIRTY HIPE JAVA KQUEUE NATIVE ODBC OPENSSL SCTP THREADS WX
OPTIONS_DEFAULT=CORBA DIRTY HIPE KQUEUE OPENSSL SCTP THREADS
OPTIONS_EXCLUDE_powerpc64=	HIPE ${OPTIONS_EXCLUDE_${ARCH}_${OSREL:R}}

CORBA_DESC=	Enable Corba support
DIRTY_DESC=	Enable Dirty schedulers
HIPE_DESC=	Build native HiPE compiler
KQUEUE_DESC=	Enable Kernel Poll (kqueue) support
NATIVE_DESC=	Enable native libraries
SCTP_DESC=	Enable SCTP support
WX_DESC=	Enable WX application

NATIVE_IMPLIES=	HIPE

# If you run Erlang and get a message resembling "WARNING: number of
# probes fixed does not match the number of defined probes (54 != 132,
# respectively)" you probably misconfigured DTrace in some way.

CONFIGURE_ENABLE=	smp-support

DIRTY_CONFIGURE_ENABLE=	dirty-schedulers
HIPE_CONFIGURE_ENABLE=	hipe
JAVA_CONFIGURE_ENV=	ac_cv_prog_JAVAC="${JAVAC}"
JAVA_CONFIGURE_WITH=	javac
JAVA_VARS=		USE_JAVA=yes
KQUEUE_CONFIGURE_ENABLE=kernel-poll
NATIVE_CONFIGURE_ENABLE=native-libs
ODBC_CONFIGURE_WITH=	odbc
ODBC_LIB_DEPENDS=	libodbc.so:databases/unixODBC
OPENSSL_CONFIGURE_WITH=	ssl=${OPENSSLBASE}
OPENSSL_USES=		ssl
SCTP_CONFIGURE_ENABLE=	sctp
THREADS_CONFIGURE_ENABLE=	threads
WX_CONFIGURE_WITH=	wx-config=${WX_CONFIG}
WX_USES=		gl
WX_VARS=		USE_WX=2.8+ WX_COMPS="wx contrib" USE_GL="gl glu"

.include <bsd.port.pre.mk>

CFLAGS+=	-DMAP_NORESERVE=0

.if ${ARCH} == i386
MAKE_ARGS+=	ARCH=x86
.endif

.if ${ARCH} == armv6 || ${ARCH} == armv7
MAKE_ARGS+=	ARCH=arm
.endif

pre-configure:
	@cd ${WRKSRC} && ./otp_build autoconf

pre-configure-WX-off:
	echo "disabled by port options" > ${WRKSRC}/lib/debugger/SKIP
	echo "disabled by port options" > ${WRKSRC}/lib/et/SKIP
	echo "disabled by port options" > ${WRKSRC}/lib/observer/SKIP
	echo "disabled by port options" > ${WRKSRC}/lib/wx/SKIP

post-configure-ODBC-on:
	${RM} ${WRKSRC}/lib/odbc/SKIP

pre-build-NATIVE-on:
	@cd ${WRKSRC} && ${MAKE_CMD} clean

post-build-CORBA-on:
	cd ${WRKSRC_corba} \
		&& ${SETENV} OVERRIDE_TARGET=${CONFIGURE_TARGET} ERL_TOP=${WRKSRC_otp} ${MAKE_CMD}

post-install-CORBA-on:
	cd ${WRKSRC_corba} \
		&& ${SETENV} OVERRIDE_TARGET=${CONFIGURE_TARGET} ERL_TOP=${WRKSRC_otp} \
			${MAKE_CMD} release RELEASE_ROOT=${FAKE_DESTDIR}${PREFIX}/lib/${ERLANG_LIB}

post-install-JAVA-off:
	-${RM} -r ${FAKE_DESTDIR}${PREFIX}/lib/erlang/lib/jinterface-*

post-install-ODBC-off:
	-${RM} -r ${FAKE_DESTDIR}${PREFIX}/lib/erlang/lib/odbc-*

post-install-OPENSSL-off:
	-${RM} -r ${FAKE_DESTDIR}${PREFIX}/lib/erlang/lib/crypto-*
	-${RM} -r ${FAKE_DESTDIR}${PREFIX}/lib/erlang/lib/ssh-*
	-${RM} -r ${FAKE_DESTDIR}${PREFIX}/lib/erlang/lib/ssl-*

post-install-WX-off:
	-${RM} -r ${FAKE_DESTDIR}${PREFIX}/lib/erlang/lib/debugger-*
	-${RM} -r ${FAKE_DESTDIR}${PREFIX}/lib/erlang/lib/et-*
	-${RM} -r ${FAKE_DESTDIR}${PREFIX}/lib/erlang/lib/observer-*
	-${RM} -r ${FAKE_DESTDIR}${PREFIX}/lib/erlang/lib/wx-*

post-fake:
	${FIND} ${FAKE_DESTDIR}${PREFIX}/lib/${ERLANG_LIB}/* -type d -empty -delete
	@cd ${FAKE_DESTDIR}${PREFIX}; ${FIND} lib/${ERLANG_LIB}/* ${DATADIR_REL}/* -type f -o -type l \
		| ${SORT} >> ${TMPPLIST}

.include <bsd.port.post.mk>
