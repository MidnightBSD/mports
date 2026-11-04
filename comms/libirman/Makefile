# Created by: Douglas K. Rand <rand@meridian-enviro.com>

PORTNAME=	libirman
PORTVERSION=	0.5.2
CATEGORIES=	comms
MASTER_SITES=	SF/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for Evation's Irman infrared receiver

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake libtool pkgconfig pathfix

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

INSTALL_TARGET=	install-strip

DOCS=	AUTHORS ChangeLog README TECHNICAL TODO

OPTIONS_DEFINE=	DOCS

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
