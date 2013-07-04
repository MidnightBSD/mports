# New ports collection makefile for:	iwi-firmware
# Date created:				Jun 11 2005
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/net/iwi-firmware/Makefile,v 1.8 2006/05/08 09:37:17 flz Exp $
# $MidnightBSD: mports/net/iwi-firmware/Makefile,v 1.2 2007/02/17 21:42:51 archite Exp $

PORTNAME=	iwi-firmware
RELNAME=	ipw2200
PORTVERSION=	2.4
PORTREVISION=	7
CATEGORIES=	net sysutils

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Intel PRO/Wireless 2200 Driver Firmware

MASTERDIR=	${.CURDIR}/../ipw-firmware
MD5_FILE=	${.CURDIR}/distinfo
PLIST=		${.CURDIR}/pkg-plist
DESCR=		${.CURDIR}/pkg-descr
FILESDIR=	${.CURDIR}/files

DRIVERNAME=	iwi
DRIVERVERSION=	1.3.4
FIRMWARES=	ipw-${PORTVERSION}-boot.fw:${DRIVERNAME}-boot.fw \
		ipw-${PORTVERSION}-bss.fw:${DRIVERNAME}-bss.fw \
		ipw-${PORTVERSION}-bss_ucode.fw:${DRIVERNAME}-ucode-bss.fw \
		ipw-${PORTVERSION}-ibss.fw:${DRIVERNAME}-ibss.fw \
		ipw-${PORTVERSION}-ibss_ucode.fw:${DRIVERNAME}-ucode-ibss.fw \
		ipw-${PORTVERSION}-sniffer.fw:${DRIVERNAME}-sniffer.fw \
		ipw-${PORTVERSION}-sniffer_ucode.fw:${DRIVERNAME}-ucode-sniffer.fw

MIN7OSVERSION=	3000

.include "${MASTERDIR}/Makefile"
