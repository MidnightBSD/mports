# $MidnightBSD: mports/archivers/rpm4/Makefile,v 1.2 2009/12/13 22:21:28 laffer1 Exp $

PORTNAME=	rpm
PORTVERSION=	4.0.4
CATEGORIES=	archivers
MASTER_SITES=	http://rpm.org/releases/historical/rpm-4.0.x/ \
		ftp://ftp.mirrorservice.org/sites/ftp.rpm.org/pub/rpm/dist/rpm-4.0.x/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The RPM Package Manager
LICENSE=	gpl2

USE_GCPIO=	yes

LIB_DEPENDS=	db3.3:${PORTSDIR}/databases/db3 \
		popt.0:${PORTSDIR}/devel/popt
BUILD_DEPENDS=	${LOCALBASE}/bin/gsed:${PORTSDIR}/textproc/gsed
.if !defined(NOPORTDOCS)
BUILD_DEPENDS+=	${LOCALBASE}/bin/doxygen:${PORTSDIR}/devel/doxygen
.endif

USE_AUTOTOOLS=	libtool
LIBTOOLFILES=	configure db3/configure db/dist/configure popt/configure \
		beecrypt/configure
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_ICONV=	yes
USE_LDCONFIG=	yes
LATEST_LINK=	rpm4
CONFLICTS=	beecrypt-* rpm-3.*

.if defined(WITH_PYTHON)
CONFIGURE_ARGS+=--with-python=auto
USE_PYTHON=	yes
PLIST_SUB+=	PYTHON=""
CPPFLAGS+=	-I${PYTHON_INCLUDEDIR}
LDFLAGS+=	-L${PYTHON_LIBDIR}
.else
CONFIGURE_ARGS+=--without-python
PLIST_SUB+=	PYTHON="@comment "
.endif

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

CONFIGURE_ENV+=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS+=--without-db \
		--with-popt-prefix="${LOCALBASE}" \
		--sysconfdir=${PREFIX}/etc \
		--without-javaglue

MAN1=	gendiff.1
MAN8=	rpm.8 rpm2cpio.8 rpmbuild.8

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CFLAGS+=	-fPIC
.endif

post-patch:
	${REINPLACE_CMD} -e 's:%%LOCALBASE%%:${LOCALBASE}:' \
		${WRKSRC}/configure ${WRKSRC}/beecrypt/configure

post-install:
.if !defined(NOPORTDOCS)
	# Install documentation
	${MKDIR} ${DOCSDIR}/apidocs/html
	cd ${WRKSRC}/apidocs/html && ${FIND} . \
		| ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} \
			${DOCSDIR}/apidocs/html/
.endif

.include <bsd.port.post.mk>
