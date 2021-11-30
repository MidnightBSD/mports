# Created by: Kazuo Kuroi <kazuok@projectkitsune.com>

PORTNAME=		xnp2
DISTVERSION=		0.86
CATEGORIES=		emulators
MASTER_SITES=		http://www.nonakap.org/np2/release/

MAINTAINER=		kazuok@projectkitsune.com
COMMENT=		Emulator for the Japanese PC-9821 series

LICENSE=		bsd3

USES=			gnome pkgconfig sdl tar:bzip2

USE_GNOME=		gtk20
USE_SDL=		mixer

GNU_CONFIGURE=		yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSION}/x11

OPTIONS_DEFINE=		IA32
OPTIONS_DEFAULT=	IA32

IA32_DESC=		Enables 9821 (386 and 486) support

IA32_CONFIGURE_ENABLE=	enable-ia32

.include <bsd.port.mk>
