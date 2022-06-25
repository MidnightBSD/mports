PORTNAME=	sysconftool
PORTVERSION=	0.19
CATEGORIES=	devel
MASTER_SITES=	SF/courier/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helps to install application configuration files

LICENSE=	gpl3

USES=		autoreconf perl5 tar:bzip2
GNU_CONFIGURE=	yes

pre-patch:
	@${CP} ${TEMPLATES}/config.guess ${TEMPLATES}/config.sub ${WRKSRC}

.include <bsd.port.mk>
