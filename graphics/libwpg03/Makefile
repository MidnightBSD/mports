PORTNAME=	libwpg
PORTVERSION=	0.3.3
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}
PKGNAMESUFFIX=	03

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and tools to work with WordPerfect Graphics (WPG) files

LICENSE=	lgpl2.1 mpl
LICENSE_COMB=	dual

LIB_DEPENDS=	librevenge-0.0.so:textproc/librevenge \
		libwpd-0.10.so:textproc/libwpd010

USES=		compiler:c++11-lang libtool pathfix perl5 pkgconfig shebangfix tar:bzip2
SHEBANG_FILES=	${WRKSRC}/src/conv/svg/wpg2svgbatch.pl
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
CONFIGURE_ARGS=	--disable-werror --without-docs

.include <bsd.port.mk>
