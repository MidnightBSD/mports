PORTNAME=	libfilezilla
PORTVERSION=	0.31.1
CATEGORIES=	ftp
MASTER_SITES=	https://download.filezilla-project.org/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ library for building platform-independent programs
WWW=		https://lib.filezilla-project.org/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgnutls.so:security/gnutls \
		libnettle.so:security/nettle

USES=		compiler:c++17-lang gettext gmake iconv:wchar_t libtool \
		localbase pathfix pkgconfig tar:bzip2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
