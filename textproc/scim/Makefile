PORTNAME=	scim
PORTVERSION=	1.4.9
PORTREVISION=	3
CATEGORIES=	textproc
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Smart Common Input Method platform
WWW=		https://github.com/scim-im/scim

LICENSE=	lgpl2.1

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		compiler:c++11-lang gettext gmake gnome iconv libtool pathfix \
		pkgconfig xorg
USE_GNOME=	gtk20 intlhack
USE_XORG=	x11 xpm
USE_LDCONFIG=	yes

CPPFLAGS+=	-I${LOCALBASE}/include -D__STDC_ISO_10646__
LIBS+=		-L${LOCALBASE}/lib -liconv

post-patch:
	@${REINPLACE_CMD} 's/-lstdc++//'				\
		${WRKSRC}/extras/gtk2_immodule/Makefile.in		\
		${WRKSRC}/extras/setup/Makefile.in			\
		${WRKSRC}/src/Makefile.in				\
		${WRKSRC}/tests/Makefile.in

.include <bsd.port.mk>
