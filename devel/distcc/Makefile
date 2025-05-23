PORTNAME=	distcc
DISTVERSIONPREFIX=	v
DISTVERSION=	3.4
PORTREVISION=	2
CATEGORIES=	devel python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distribute compilation of C(++) code across machines ${${FLAVOR}_COMMENT}
WWW=		https://distcc.github.io/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${LOCALBASE}/lib/libiberty.a:devel/gnulibiberty
LIB_DEPENDS=	libpopt.so:devel/popt

FLAVORS=	default gtk
FLAVOR?=	${FLAVORS:[1]}
default_COMMENT=	(text monitor)
gtk_PKGNAMESUFFIX=	-gtk
gtk_DESCR=	${.CURDIR}/pkg-descr.gtk
gtk_COMMENT=	(gtk monitor)

USES=		alias autoreconf cpe gmake libtool localbase pkgconfig
USE_GITHUB=	yes
USE_RC_SUBR=	distccd

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS=	--disable-Werror \
		--sysconfdir=${ETCDIR} \
		CC="${CC}" \
		PTHREAD_CC="${CC}"

# test hangs on magus?
#TEST_TARGET=	check
NO_TEST=	yes

ETCDIR=		${PREFIX}/etc

SUB_FILES=	pkg-message
SUB_LIST=	DISTCCD_PIDFILE=/var/run/distccd.pid

USERS=		distcc
GROUPS=		distcc

OPTIONS_DEFINE=		AVAHI CLANGLINK DOCS IPV6 LLVMLINK PUMP
OPTIONS_DEFAULT=	CLANGLINK PUMP
OPTIONS_SUB=	yes

CLANGLINK_DESC=	Create clang compiler links if clang is installed
LLVMLINK_DESC=	Create llvm compiler links if llvm is installed
PUMP_DESC=	Distribute compilation as well as preprocessing to distcc servers

AVAHI_LIB_DEPENDS=	libavahi-client.so:net/avahi-app
AVAHI_CONFIGURE_WITH=	avahi
IPV6_CONFIGURE_ENABLE=	rfc2553
PUMP_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR}
PUMP_USES=		python
PUMP_USE_PYTHON=	flavors
PUMP_CONFIGURE_ENABLE=	pump-mode

# Leave CCLINKDIR without a leading underscore as it is a variable, which could
# be set by the user.
CCLINKDIR?=		libexec/distcc
_DISTCC_COMPILERS=	CC c++ cc

GNU_COMPILERS=		10 11 12 13 14 15 6
_DISTCC_COMPILERS+=	gcc g++ ${GNU_COMPILERS:S|^|g++|} \
			${GNU_COMPILERS:S|^|gcc|} \
			${EXTRA_COMPILERS}

.include <bsd.mport.options.mk>

.if ${FLAVOR} == gtk
USES+=		gnome
USE_GNOME=	gtk30
CONFIGURE_ARGS+=	--with-gtk
PLIST_SUB+=	GTK=""
.else
PLIST_SUB+=	GTK="@comment "
.endif

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MPUMP}
.if ${PYTHON_VER} != ${PYTHON_DEFAULT}
PKGNAMEPREFIX=		${PYTHON_PKGNAMEPREFIX}
.endif
.endif

.if ${PORT_OPTIONS:MCLANGLINK}
CLANG_COMPILERS=	-devel 11 12 13 14 15 16 17 18 19
_DISTCC_COMPILERS+=	clang++ clang ${CLANG_COMPILERS:S|^|clang++|} \
			${CLANG_COMPILERS:S|^|clang|}
.endif
.if ${PORT_OPTIONS:MLLVMLINK}
_DISTCC_COMPILERS+=	llvm-c++ llvm-g++ llvm-gcc
.endif

post-install:
	@${MKDIR} ${PREFIX}/${CCLINKDIR}
.for link in ${_DISTCC_COMPILERS}
	@${LN} ${PREFIX}/bin/distcc \
	    ${PREFIX}/${CCLINKDIR}/${link}
.endfor
	${RM} -rf ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/*/__pycache__
	${RM} -rf ${PREFIX}/${DOCSDIR_REL}/example

post-install-PUMP-on:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/include_server/distcc_pump_c_extensions.cpython-${PYTHON_SUFFIX}.so

.include <bsd.port.post.mk>
