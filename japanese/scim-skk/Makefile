PORTNAME=	scim-skk
PORTVERSION=	0.5.2
PORTREVISION=	12
CATEGORIES=	japanese
MASTER_SITES=	OSDN/scim-imengine

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SCIM IMEngine module like SKK
WWW=		https://sourceforge.jp/projects/scim-imengine/

BUILD_DEPENDS=	scim:textproc/scim
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		gmake iconv libtool pkgconfig
GNU_CONFIGURE=	yes

INSTALL_TARGET=	install-strip

CPPFLAGS+=	-I${LOCALBASE}/include -D__STDC_ISO_10646__
LDFLAGS+=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} "s|%%LOCALBASE%%|${LOCALBASE}|" ${WRKSRC}/src/scim_skk_prefs.h

.include <bsd.port.mk>
