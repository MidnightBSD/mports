PORTNAME=	scim-uim
PORTVERSION=	0.2.0
PORTREVISION=	20
CATEGORIES=	japanese
MASTER_SITES=	SF/scim/${PORTNAME}/${PORTVERSION} \
		http://freedesktop.org/~suzhe/sources/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SCIM IMEngine module using UIM input method library
WWW=		https://sourceforge.net/projects/scim/files/scim-uim/

BUILD_DEPENDS=	scim:textproc/scim
LIB_DEPENDS=	libuim.so:textproc/uim
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		gmake iconv libtool:keepla pkgconfig
GNU_CONFIGURE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
