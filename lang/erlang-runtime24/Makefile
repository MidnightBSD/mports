PORTNAME=	erlang
DISTVERSIONPREFIX=	OTP-
DISTVERSION=	24.3.4.17
PORTREVISION=	1
CATEGORIES=	lang parallel java
PKGNAMESUFFIX=	-runtime24
DIST_SUBDIR=	erlang

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Functional programming language from Ericsson
WWW=		https://www.erlang.org/

LICENSE=	Apache-2.0

USES=		compiler cpe gmake ncurses perl5
CPE_VENDOR=	erlang
CPE_PRODUCT=	erlang/otp
USE_GITHUB=	nodefault
GH_ACCOUNT=	erlang:otp,corba
GH_PROJECT=	otp:otp corba:corba
GH_TAGNAME=	5.2:corba
USE_PERL5=	build

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-dirty-schedulers \
		--enable-kernel-poll \
		--enable-smp-support \
		--enable-threads
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4
MAKE_ARGS=	all

DATADIR=	${PREFIX}/share/${PORTNAME}${PKGNAMESUFFIX}
SUB_FILES=	pkg-message
SUB_LIST=	ERLANG_LIB=${ERLANG_LIB}

WRKSRC=		${WRKSRC_otp}

ERLANG_LIB=	${PORTNAME}${PORTVERSION:C/\..*//}

OPTIONS_DEFINE=		CHUNKS CORBA DTRACE JAVA KQUEUE ODBC OPENSSL SCTP \
			SHARING WX
OPTIONS_DEFAULT=	CHUNKS CORBA KQUEUE OPENSSL SCTP SHARING

.if !exists(/usr/sbin/dtrace)
OPTIONS_EXCLUDE+=	DTRACE
.endif

OPTIONS_EXCLUDE_i386=	DTRACE

CHUNKS_DESC=	Enable in-line documentation in Erlang console
CORBA_DESC=	Enable Corba support
KQUEUE_DESC=	Enable Kernel Poll (kqueue) support
SCTP_DESC=	Enable SCTP support
SHARING_DESC=	Enable term copy-and-share support
WX_DESC=	Enable WX application

# If you run Erlang and get a message resembling "WARNING: number of
# probes fixed does not match the number of defined probes (54 != 132,
# respectively)" you probably misconfigured DTrace in some way.

CHUNKS_MAKE_ARGS+=		docs DOC_TARGETS=chunks
DTRACE_CONFIGURE_WITH=		dynamic-trace=dtrace
DTRACE_CFLAGS=			-fno-omit-frame-pointer
DTRACE_VARS=			STRIP=""
JAVA_CONFIGURE_WITH=		javac
JAVA_CONFIGURE_ENV=		ac_cv_prog_JAVAC="${JAVAC}"
JAVA_USES=			java
KQUEUE_CONFIGURE_ENABLE=	kernel-poll
ODBC_LIB_DEPENDS=		libodbc.so:databases/unixODBC
ODBC_USES=			localbase:ldflags
ODBC_CONFIGURE_WITH=		odbc
OPENSSL_USES=			ssl
OPENSSL_CONFIGURE_WITH=		ssl=${OPENSSLBASE}
SCTP_CONFIGURE_ENABLE=		sctp
SHARING_CONFIGURE_ENABLE=	sharing-preserving
WX_USES=			gl
WX_CONFIGURE_WITH=		wx-config=${WX_CONFIG}
WX_VARS=			USE_GL="gl glu" \
				USE_WX=3.2+ \
				WX_COMPS="wx"

.include <bsd.port.pre.mk>

.if ${COMPILER_TYPE} == clang && ${COMPILER_VERSION} >= 130
# PR 258494
CONFIGURE_ARGS+=	--disable-pgo
.endif


CFLAGS+=	-DMAP_NORESERVE=0


.if ${ARCH} == i386
MAKE_ARGS+=	ARCH=x86
.endif

.if ${ARCH} == armv6 || ${ARCH} == armv7
MAKE_ARGS+=	ARCH=arm
.endif

pre-configure-WX-off:
	echo "disabled by port options" > ${WRKSRC}/lib/debugger/SKIP
	echo "disabled by port options" > ${WRKSRC}/lib/et/SKIP
	echo "disabled by port options" > ${WRKSRC}/lib/observer/SKIP
	echo "disabled by port options" > ${WRKSRC}/lib/wx/SKIP

post-configure-ODBC-on:
	${RM} ${WRKSRC}/lib/odbc/SKIP

post-configure-ODBC-off:
	echo "disabled by port options" > ${WRKSRC}/lib/odbc/SKIP

post-build-CORBA-on:
	cd ${WRKSRC_corba} \
		&& ${SETENV} OVERRIDE_TARGET=${CONFIGURE_TARGET} ERL_TOP=${WRKSRC_otp} ${MAKE_CMD}

post-install-CORBA-on:
	cd ${WRKSRC_corba} \
		&& ${SETENV} OVERRIDE_TARGET=${CONFIGURE_TARGET} ERL_TOP=${WRKSRC_otp} \
			${MAKE_CMD} release RELEASE_ROOT=${FAKE_DESTDIR}${PREFIX}/lib/${ERLANG_LIB}

post-install-DTRACE-on:
	${MKDIR} ${FAKE_DESTDIR}${DATADIR}/dtrace
	${INSTALL_DATA} ${WRKSRC}/erts/emulator/beam/*.d \
		${WRKSRC}/lib/runtime_tools/c_src/*.d \
		${WRKSRC}/lib/runtime_tools/examples/*.d \
		${FAKE_DESTDIR}${DATADIR}/dtrace

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
