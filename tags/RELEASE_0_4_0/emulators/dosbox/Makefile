# $MidnightBSD: mports/emulators/dosbox/Makefile,v 1.10 2013/04/11 12:33:47 laffer1 Exp $

PORTNAME=	dosbox
PORTVERSION=	0.74
PORTREVISION=	2
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

DESKTOP_ENTRIES="DOSBox" "${COMMENT}" \
		"" "dosbox" \
		"System;Emulator;" "true"

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's#\/usr\/share\/doc\/dosbox#${DOCSDIR}#g' \
		${WRKSRC}/docs/dosbox.1

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
