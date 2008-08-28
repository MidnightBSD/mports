# New ports collection makefile for:	autoconf
# Date created:		7 October 1995
# Whom:			torstenb@FreeBSD.org
#
# $MidnightBSD: mports/devel/gnu-autoconf/Makefile,v 1.1 2006/09/21 13:41:17 laffer1 Exp $
# $FreeBSD: ports/devel/gnu-autoconf/Makefile,v 1.65 2005/06/16 17:27:25 ade Exp $
#

PORTNAME=	autoconf
PORTVERSION=	2.59
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	autoconf
PKGNAMEPREFIX=	gnu-
DISTNAME=	autoconf-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatically configure source code on many Un*x platforms (GNU unmodified)
LICENSE=	gpl2

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4 \
		help2man:${PORTSDIR}/misc/help2man
RUN_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_PERL5=	yes

PREFIX?=	${LOCALBASE}/gnu-autotools

GNU_CONFIGURE=	yes
NO_MTREE=	yes
INFO=		autoconf standards
CONFIGURE_ENV+=	CONFIG_SHELL=${SH}
CONFIGURE_ENV+=	M4=${LOCALBASE}/bin/gm4
CONFIGURE_ARGS=	--without-lispdir
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

MAN1=		autoconf.1 autoheader.1 autom4te.1 autoreconf.1 autoscan.1 \
		autoupdate.1 config.guess.1 config.sub.1 ifnames.1

.include <bsd.port.mk>
