# $MidnightBSD: mports/audio/gsm/Makefile,v 1.3 2009/12/29 17:57:14 laffer1 Exp $
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

MAN1=		toast.1
MAN3=		gsm.3 gsm_explode.3 gsm_option.3 gsm_print.3
MLINKS=		toast.1 untoast.1 toast.1 tcat.1

.include <bsd.port.mk>
