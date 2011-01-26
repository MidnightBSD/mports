# $MidnightBSD: mports/x11/libXv/Makefile,v 1.1 2007/10/05 17:48:09 ctriv Exp $

PORTNAME=	libXv
PORTVERSION=	1.0.4
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Video Extension library
LICENSE=	x11	

XORG_CAT=	lib
USE_XORG=	x11 xext xextproto videoproto:both xproto

MAN3=	Xv.3 \
	XvFreeAdaptorInfo.3 \
	XvFreeEncodingInfo.3 \
	XvGetPortAttribute.3 \
	XvGetStill.3 \
	XvGetVideo.3 \
	XvGrabPort.3 \
	XvPortNotify.3 \
	XvPutStill.3 \
	XvPutVideo.3 \
	XvQueryAdaptors.3 \
	XvQueryBestSize.3 \
	XvQueryEncodings.3 \
	XvQueryExtension.3 \
	XvSelectPortNotify.3 \
	XvSelectVideoNotify.3 \
	XvSetPortAttribute.3 \
	XvStopVideo.3 \
	XvUngrabPort.3 \
	XvVideoNotify.3

.include <bsd.port.mk>
