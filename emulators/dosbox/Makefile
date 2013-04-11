# $MidnightBSD: mports/emulators/dosbox/Makefile,v 1.9 2010/11/10 14:26:05 laffer1 Exp $

PORTNAME=	dosbox
PORTVERSION=	0.74
PORTREVISION=	1
CATEGORIES=	emulators
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An emulator of a PC with DOS
LICENSE=	gpl2

LIB_DEPENDS=	png15:${PORTSDIR}/graphics/png

GNU_CONFIGURE=	yes
USE_SDL=	sdl net sound

MAN1=		dosbox.1
PKGMESSAGE=	${WRKDIR}/pkg-message

CPPFLAGS+=		-I${LOCALBASE}/include
CONFIGURE_ARGS+=	--enable-core-inline

post-patch:
	@${REINPLACE_CMD} -e 's#\/usr\/share\/doc\/dosbox#${DOCSDIR}#g' \
		${WRKSRC}/docs/dosbox.1
	@${SED} 's#%%DOCSDIR%%#${DOCSDIR}#' ${PKGDIR}/pkg-message > \
		${WRKDIR}/pkg-message

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/dosbox ${PREFIX}/bin/dosbox
	${INSTALL_MAN} ${WRKSRC}/docs/dosbox.1 ${PREFIX}/man/man1/
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/NEWS ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/INSTALL ${DOCSDIR}
.endif

.include <bsd.port.mk>
