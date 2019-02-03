# $MidnightBSD$

PORTNAME=	timidity
PORTVERSION=	0.2i
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES+=	http://www.onicos.com/staff/iz/timidity/dist/:timidity
DISTFILES+=	${DISTNAME}.tar.gz:timidity
EXTRACT_ONLY=	${DISTNAME}.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MIDI to PCM software synthesizer

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS+=	trueprefix

CONFLICTS=	timidity++-2.*

TIINS=		goemon.tgz
INSTALL_TARGET=	install.all

OPTIONS_DEFINE=	GUSPAT
GUSPAT_DESC=	Use audio/guspat instead of included sound fonts (goemon)

.include <bsd.mport.options.mk>

# Set up sound fonts from audio/guspat.
.if ${PORT_OPTIONS:MGUSPAT}
RUN_DEPENDS+=	${LOCALBASE}/share/guspat/power.cfg:${PORTSDIR}/audio/guspat
TDIR=		${LOCALBASE}/share/timidity
TCONFIG=	timidity.cfg-guspat
PLIST_SUB+=	GOEMON="@comment "
.else
# Set up default sound fonts (goemon).
MASTER_SITES+=	http://www.anime.net/~goemon/timidity/:tiins
DISTFILES+=	${TIINS}:tiins
TDIR=		${TRUE_PREFIX}/lib/timidity
TCONFIG=	goemon.cfg
PLIST_SUB+=	GOEMON=""
.endif

post-patch:
	${REINPLACE_CMD} -e 's,machine/soundcard.h,sys/soundcard.h,' \
		${WRKSRC}/linux_a.c
	${REINPLACE_CMD} -e 's|%%TDIR%%|${TDIR}| ; s|%%TCONFIG%%|${TCONFIG}|' \
		${WRKSRC}/timidity.cfg

post-install:
.if ! ${PORT_OPTIONS:MGUSPAT}
	${MKDIR} ${PREFIX}/lib/timidity
	cd ${PREFIX}/lib/timidity && \
	${TAR} --no-same-owner --no-same-permissions -zxf ${DISTDIR}/${TIINS} && \
	${REINPLACE_CMD} -i "" -e 's,dir goemon,dir ${TRUE_PREFIX}/lib/timidity/goemon,' \
		goemon.cfg
.endif

.include <bsd.port.mk>
