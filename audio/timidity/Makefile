PORTNAME=	timidity
PORTVERSION=	0.2i
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES+=	http://www.onicos.com/staff/iz/timidity/dist/:timidity
DISTFILES+=	${DISTNAME}.tar.gz:timidity

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MIDI to PCM software synthesizer
WWW=		http://www.onicos.com/staff/iz/timidity/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS+=	trueprefix
SKIP_FAKE_CHECK=	lib/timidity/goemon/gsdrum40/gsdrum40.bak

CONFLICTS=	timidity++-2.*

USES=		ncurses

TIINS=		goemon.tgz
INSTALL_TARGET=	install.all

OPTIONS_SINGLE=	FONTS
OPTIONS_SINGLE_FONTS=	GOEMON GUSPAT
OPTIONS_DEFAULT=GOEMON
OPTIONS_SUB=	yes

FONTS_DESC=		Default sound fonts

GUSPAT_DESC=		Use from audio/guspat port
GUSPAT_RUN_DEPENDS=	${LOCALBASE}/share/guspat/power.cfg:audio/guspat
GUSPAT_VARS=		TDIR="${LOCALBASE}/share/timidity" \
			TCONFIG=timidity.cfg-guspat

GOEMON_DESC=		Bundle from Goemon's patchkit #'
GOEMON_MASTER_SITES=	http://www.anime.net/~goemon/timidity/:tiins
GOEMON_DISTFILES=	goemon.tgz:tiins
GOEMON_VARS=		TDIR="${PREFIX}/lib/timidity" \
			TCONFIG=goemon.cfg

post-patch:
	${REINPLACE_CMD} -i '' -e 's,machine/soundcard.h,sys/soundcard.h,' \
		${WRKSRC}/linux_a.c
	${REINPLACE_CMD} -i '' -e 's|%%TDIR%%|${TDIR}| ; s|%%TCONFIG%%|${TCONFIG}|' \
		${WRKSRC}/timidity.cfg

post-patch-GOEMON-on:
	${REINPLACE_CMD} -i '' -e '/^dir/s,goemon,${TDIR}/&,' \
		${WRKDIR}/${TCONFIG}

post-install-GOEMON-on:
	(cd ${WRKDIR} && ${COPYTREE_SHARE} "goemon*" ${FAKE_DESTDIR}${TDIR})

.include <bsd.port.mk>
