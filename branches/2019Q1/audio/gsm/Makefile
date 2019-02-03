# $MidnightBSD$
# $FreeBSD: ports/audio/gsm/Makefile,v 1.22 2006/08/11 20:55:54 sobomax Exp $

PORTNAME=	gsm
PORTVERSION=	1.0.13
CATEGORIES=	audio
MASTER_SITES=	ftp://ftp.dvo.ru/pub/Gentoo/distfiles/ \
 		http://www.imagemagick.org/download/delegates/ffmpeg/ \
 		http://www.quut.com/gsm/ \
 		http://downloads.openwrt.org/sources/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio converter and library for converting u-law to gsm encoding

LICENSE=	other 
# fairly loose, bsdish.

WRKSRC=		${WRKDIR}/gsm-1.0-pl13

USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

.include <bsd.port.mk>
