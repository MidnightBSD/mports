# New ports collection makefile for:	kexchange
# Date created:				17 October 2003
# Whom:					Adam Weinberger <adamw@FreeBSD.org>
#
# $MidnightBSD: mports/finance/kexchange/Makefile,v 1.2 2009/09/20 01:09:12 laffer1 Exp $
# $FreeBSD: ports/finance/kexchange/Makefile,v 1.13 2007/05/19 20:04:55 flz Exp $
#

PORTNAME=	kexchange
PORTVERSION=	1.0
PORTREVISION=	5
CATEGORIES=	finance kde
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE currency converter
LICENSE=	gpl2

USE_KDELIBS_VER=3
USE_AUTOTOOLS=	libtool

post-patch:
	@${REINPLACE_CMD} -e 's|-O2||g' ${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>
