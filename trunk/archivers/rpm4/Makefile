# $MidnightBSD: mports/archivers/rpm4/Makefile,v 1.4 2011/05/30 18:17:42 laffer1 Exp $

PORTNAME=	rpm
PORTVERSION=	4.9.1
PORTREVISION=	0
CATEGORIES=	archivers
MASTER_SITES=	http://rpm.org/releases/rpm-${PORTVERSION:R}.x/ \
		ftp://ftp.mirrorservice.org/sites/ftp.rpm.org/pub/rpm/dist/rpm-${PORTVERSION:E}.x/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The RPM Package Manager
LICENSE=	gpl2

LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt \
		nss3:${PORTSDIR}/security/nss
BUILD_DEPENDS=	${LOCALBASE}/bin/gsed:${PORTSDIR}/textproc/gsed

OPTIONS=	PYTHON "Build Python rpm module" On

USE_AUTOTOOLS=	libtool
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_LUA=	5.1+
USE_BDB=	45+
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
LATEST_LINK=	rpm4
CONFLICTS=	rpm-3.*

CPPFLAGS+=	-I${LOCALBASE}/include/nspr -I${LOCALBASE}/include/nss/nss \
		-I${BDB_INCLUDE_DIR} -I${LUA_INCDIR}
LDFLAGS+=	-L${LOCALBASE}/lib/nss -L${BDB_LIB_DIR} -L${LUA_LIBDIR}
CONFIGURE_ARGS+=--with-external-db \
		LUA_CFLAGS=-I${LUA_INCDIR} \
		LUA_LIBS="-L${LUA_LIBDIR} -llua-${LUA_VER} -lm"
PLIST_SUB+=   VERSION=${PORTVERSION}


.include <bsd.mport.options.mk>

.if (${OSVERSION} < 4005)
LIB_DEPENDS+=   lzma.5:${PORTSDIR}/archivers/xz
.endif

.ifndef	WITHOUT_PYTHON
CONFIGURE_ARGS+=--enable-python
USE_PYTHON=	2.6+
PLIST_SUB+=	PYTHON=""
CPPFLAGS+=	-I${PYTHON_INCLUDEDIR}
LDFLAGS+=	-L${PYTHON_LIBDIR}
.else
CONFIGURE_ARGS+=--disable-python
PLIST_SUB+=	PYTHON="@comment "
.endif

.ifdef	WITHOUT_NLS
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
USE_ICONV=	yes
PLIST_SUB+=	NLS=""
.endif

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

CONFIGURE_ENV+=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS+=--without-db \
		--with-popt-prefix="${LOCALBASE}" \
		--sysconfdir=${PREFIX}/etc \
		--localstatedir=/var \
		--without-javaglue

MANLANG=	"" ja fr pl ru ko sk
MAN1_EN=	gendiff.1
MAN8_EN=	rpm.8 rpm2cpio.8 rpmbuild.8 rpmdeps.8 rpmgraph.8
MAN8_JA=	rpm.8 rpm2cpio.8 rpmbuild.8 rpmgraph.8
MAN8_FR=	rpm.8
MAN8_PL=	rpm.8 rpm2cpio.8 rpmbuild.8 rpmdeps.8 rpmgraph.8
MAN8_RU=	rpm.8 rpm2cpio.8
MAN8_KO=	rpm.8 rpm2cpio.8
MAN8_SK=	rpm.8

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 800502
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-rpmio_rpmsq.c
.endif
.if ${OSVERSION} < 700000
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-lib_fs.c
.endif

.if ${OSVERSION} < 4005
LIB_DEPENDS+=	lzma:${PORTSDIR}/archivers/xz
.endif

post-patch:
	${REINPLACE_CMD} -e '/^pkgconfigdir/s:/:data/:' \
		-e 's:\.\./\.\./bin/::' ${WRKSRC}/Makefile.in
	${REINPLACE_CMD} -e 's/(hpux)/& || defined(__FreeBSD__)/' \
		${WRKSRC}/rpmio/fts.?

post-install:
.if !defined(NOPORTDOCS)
	# Install documentation
	${MKDIR} ${DOCSDIR}/librpm/html
	cd ${WRKSRC}/doc/librpm/html && ${FIND} . \
		| ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} \
			${DOCSDIR}/librpm/html/
.endif

.include <bsd.port.post.mk>
