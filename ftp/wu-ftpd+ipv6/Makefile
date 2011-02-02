# New ports collection makefile for:	wu-ftpd+ipv6
# Date created:		30 Aug 2002
# Whom:			sumikawa
#
# $MidnightBSD: mports/ftp/wu-ftpd+ipv6/Makefile,v 1.3 2008/10/20 12:42:22 laffer1 Exp $
# $FreeBSD: ports/ftp/wu-ftpd+ipv6/Makefile,v 1.62 2006/06/07 06:31:12 sumikawa Exp $
#
# REMINDER: to use ftpaccess(5) you need to specify -a in command line,
# it is changed from previous versions

PORTNAME=	wu-ftpd+ipv6
PORTVERSION=	2.6.2
PORTREVISION=	8
CATEGORIES=	ftp ipv6
MASTER_SITES=	ftp://ftp.wu-ftpd.org/pub/wu-ftpd/
DISTNAME=	wu-ftpd-${PORTVERSION}

PATCH_SITES=	ftp://ftp.kame.net/pub/kame/misc/
PATCHFILES=	wu-ftpd-262-v6-20040130.diff.gz
PATCH_DIST_STRIP=	-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A replacement ftp server for Un*x systems
LICENSE=	other

CONFLICTS=	wu-ftpd-[0-9]* heimdal-[0-9]*

USE_AUTOTOOLS=	autoconf213
CONFIGURE_ARGS=	--enable-rfc931 --disable-pasvip \
		--enable-noop --disable-numericuid  --enable-nlst-dirs \
		--enable-ipv6 \
		--prefix=${PREFIX} --with-etc-dir=${PREFIX}/etc

.if !defined(WITH_PAM)
CONFIGURE_ARGS+= --enable-opie
.else
CONFIGURE_ARGS+= --enable-pam
EXTRA_PATCHES+=	${FILESDIR}/ftpd.c-pam
.endif

MAKE_ENV+=	WARNINGS=-DSPT_TYPE=SPT_BUILTIN

MAN1=		ftpcount.1 ftpwho.1
MAN5=		ftpaccess.5 ftphosts.5 ftpconversions.5 xferlog.5 \
		ftpservers.5
MAN8=		ftpd.8 ftpshut.8 ftprestart.8 privatepw.8

.include <bsd.port.mk>
