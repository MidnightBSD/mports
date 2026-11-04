PORTNAME=	zinnia
PORTVERSION=	0.6.0
CATEGORIES=	japanese
MASTER_SITES=	SF/zinnia/${PORTNAME}${PKGNAMESUFFIX}/${PORTVERSION}-20080911
PKGNAMESUFFIX=	-tomoe
DISTNAME=	${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}-20080911

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Handwriting recognition files for Zinnia (Tomoe data)
WWW=		http://zinnia.sourceforge.net/

LICENSE=	lgpl2.1

LIB_DEPENDS=	libzinnia.so:japanese/zinnia
RUN_DEPENDS=	zinnia:japanese/zinnia

USES=	tar:bzip2
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
