# $MidnightBSD: mports/audio/timidity/Makefile,v 1.1 2009/11/01 22:22:30 laffer1 Exp $

PORTNAME=	timidity
PORTVERSION=	0.2i
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	ftp://ftp.kiarchive.ru/pub/misc/hardware/soundcard/gus/:tiins \
		http://www.onicos.com/staff/iz/timidity/dist/:timidity
DISTFILES=	${TIINS}:tiins ${DISTNAME}.tar.gz:timidity
EXTRACT_ONLY=	${DISTNAME}.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MIDI to WAV renderer and player
LICENSE=	restricted

CONFLICTS=	timidity++-2.13.*

NO_CDROM=	"Uses copyrighted patches"

TIINS=		goemon.tgz
INSTALL_TARGET=	install.all
MAN1=		timidity.1

post-patch:
	${REINPLACE_CMD} -e 's,machine/soundcard.h,sys/soundcard.h,' \
		${WRKSRC}/linux_a.c

post-install:
	cd ${PREFIX}/lib/timidity && \
	${TAR} --no-same-owner --no-same-permissions -zxf ${DISTDIR}/${TIINS} && \
	${REINPLACE_CMD} -i "" -e 's,dir goemon,dir ${TRUE_PREFIX}/lib/timidity/goemon,' \
		goemon.cfg

.include <bsd.port.mk>
