# Created by: Matthias Andree <mandree@FreeBSD.org>

PORTNAME=	db18
PORTVERSION=	18.1.40
CATEGORIES=	databases java
MASTER_SITES=	https://github.com/yasuhirokimura/${PORTNAME}/releases/download/${PORTVERSION}/
PKGNAMEPREFIX?=
#
# the distfiles aren't named db18-* but db-*:
DISTNAME=	db-${PORTVERSION}
DIST_SUBDIR=	bdb

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Oracle Berkeley DB, Release ${BDBVER}

LICENSE=	agpl bsd3 UPL10
LICENSE_COMB=	multi
LICENSE_NAME_UPL10=	The Universal Permissive License (UPL), Version 1.0
LICENSE_FILE=	${WRKSRC}/../LICENSE
LICENSE_FILE_UPL10=	${WRKSRC}/../EXAMPLES-LICENSE
LICENSE_PERMS_UPL10=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BDBVER=		${PORTVERSION:R}
BDBMAJ=		${BDBVER:R}
CONFIGURE_ARGS=	--enable-cxx --enable-stl --enable-dbm \
		--enable-compat185 --enable-dump185 \
		--includedir=${PREFIX}/include/${PORTNAME} \
		--libdir=${PREFIX}/lib/${PORTNAME} \
		--bindir=${PREFIX}/bin/${PORTNAME} \
		--host=${ARCH}-portbld-midnightbsd${OSREL} \
		--target=${ARCH}-portbld-midnightbsd${OSREL}
CONFIGURE_SCRIPT=	../dist/configure
GNU_CONFIGURE=	yes
USES=		gmake libtool ssl
INSTALL_TARGET=	install_include install_lib install_utilities
WRKSRC=		${WRKDIR}/${DISTNAME}/build_unix
PATCH_WRKSRC=	${WRKDIR}/${DISTNAME}
USE_LDCONFIG=	yes
PLIST_SUB=	BDBMAJ=${BDBMAJ} BDBVER=${BDBVER}
MAKE_ARGS+=	docdir=${DOCSDIR}

OPTIONS_DEFINE=	CRYPTO DEBUG L10N JAVA TCL DOCS
OPTIONS_DEFAULT=CRYPTO
OPTIONS_SUB=	yes
CRYPTO_DESC=	Cryptography support
L10N_DESC=	Localization support (EXPERIMENTAL)

PORTDOCS=	*

DBLIBS=	libdb libdb_cxx libdb_stl

DEBUG_CONFIGURE_ENABLE=	debug umrw
CRYPTO_CONFIGURE_WITH=	cryptography=yes
L10N_CONFIGURE_ENABLE=	localization
JAVA_USE=		java
JAVA_VARS=		DBLIBS+=libdb_java JAVA_VERSION="7+"
JAVA_CONFIGURE_ENABLE=	java
JAVA_CPPFLAGS=		-I"${JAVA_HOME}/include"
JAVA_CONFIGURE_ENV=	JAVAC="${JAVAC}" JAR="${JAR}" JAVA="${JAVA}"
TCL_CONFIGURE_ENABLE=	tcl
TCL_USES=		tcl
TCL_CONFIGURE_WITH=	tcl=${TCL_LIBDIR}
TCL_VARS=		DBLIBS+=libdb_tcl 
DOCS_INSTALL_TARGET=	install_docs

.include <bsd.mport.options.mk>

.if ${ARCH} == aarch64
CONFIGURE_ARGS+=	--with-mutex=POSIX/pthreads
.endif

post-install:
.for i in ${DBLIBS}
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/${PORTNAME}/${i}-${BDBVER}.so
	${LN} -s -f ${PORTNAME}/${i}-${BDBVER}.so ${STAGEDIR}${PREFIX}/lib
	${LN} -s -f ${PORTNAME}/${i}-${BDBVER}.so ${STAGEDIR}${PREFIX}/lib/${i}-${BDBMAJ}.so
	${LN} -s -f ${i}-${BDBVER}.a ${STAGEDIR}${PREFIX}/lib/${PORTNAME}/${i}.a
.endfor
	cd ${STAGEDIR}${PREFIX}/bin/${PORTNAME}; \
	for i in *; do ${LN} -s -f ${PORTNAME}/$$i ../$$i-${BDBVER} ; done

post-install-JAVA-off:
	${RM} -r ${FAKE_DESTDIR}${DOCSDIR}/java
.for i in gsg gsg_db_rep gsg_txn
	${RM} -r ${FAKE_DESTDIR}${DOCSDIR}/${i}/JAVA
.endfor

post-install-TCL-on:
	echo "package ifneeded Db_tcl ${BDBVER} \
	      [list load [file join $$dir libdb_tcl-${BDBVER}.so]] \
	     " > ${FAKE_DESTDIR}${PREFIX}/lib/${PORTNAME}/pkgIndex.tcl

post-install-TCL-off:
.for i in api_reference/TCL
	${RM} -r ${FAKE_DESTDIR}${DOCSDIR}/${i}
.endfor

.include <bsd.port.mk>
