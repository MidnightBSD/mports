PORTNAME=	libunwind
PORTVERSION=	20240221	# This is the release date on https://github.com/libunwind/libunwind/releases
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	https://github.com/libunwind/libunwind/releases/download/v${LIBUNWIND_VERSION}/
DISTNAME=	libunwind-${LIBUNWIND_VERSION}

PATCH_SITES=	https://github.com/libunwind/libunwind/commit/
PATCHFILES=	b841b2a2665da25dd28fd16977a77bf8b3494dc7.patch:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic stack unwinding library
WWW=		https://github.com/libunwind/libunwind \
		https://www.nongnu.org/libunwind/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

ONLY_FOR_ARCHS=	aarch64 amd64 armv6 armv7 i386 powerpc powerpc64 powerpc64le

USES=		compiler:c11 cpe libtool pathfix pkgconfig

CONFIGURE_ARGS=	--disable-cxx-exceptions \
		--disable-unwind-header \
		ac_cv_path_LATEX2MAN=${TRUE}
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

PLIST_SUB=	ARCH=${ARCH:S|amd64|x86_64|:C|armv.|arm|:S|i386|x86|:C|powerpc64.*|ppc64|:S|powerpc|ppc32|}

CPE_VENDOR=	libunwind_project

LIBUNWIND_VERSION=	1.8.1

.include <bsd.mport.options.mk>

PLIST_FILES=	include/unwind.h

.if ${ARCH:Mpowerpc*}
PLIST_SUB+=	COREDUMP="@comment "
.else
PLIST_SUB+=	COREDUMP=""
.endif

post-install:
	${INSTALL_DATA} ${FILESDIR}/unwind.h ${STAGEDIR}${PREFIX}/include
	cd ${STAGEDIR}${PREFIX}/ && ${FIND} libexec/libunwind -type f >> ${TMPPLIST}

.include <bsd.port.mk>
