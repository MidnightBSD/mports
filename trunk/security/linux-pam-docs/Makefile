# New ports collection makefile for: Linux-PAM offline documentation
# Date created:		19 Jun 2003
# Whom:			Hideyuki KURASHINA <rushani@FreeBSD.org>
#
# $MidnightBSD: mports/security/linux-pam-docs/Makefile,v 1.3 2007/08/07 21:35:25 laffer1 Exp $
# $FreeBSD: ports/security/linux-pam-docs/Makefile,v 1.1 2003/10/10 06:06:13 edwin Exp $
#

PORTNAME=	linux-pam-docs
PORTVERSION=	0.76
CATEGORIES=	security
MASTER_SITES=	http://www.kernel.org/pub/linux/libs/pam/pre/doc/
DISTNAME=	Linux-PAM-${PORTVERSION}-docs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux-PAM offline documentation

LICENSE=	unknown

USE_GCPIO=	yes
NO_WRKSUBDIR=	yes
NO_BUILD=	yes
CPIODO=		gcpio --quiet -pdum -R

do-install:
	@ ${MKDIR} ${DOCSDIR}
	@ cd ${WRKSRC} && ${FIND} * \
	  | ${CPIODO} ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}

.include <bsd.port.mk>
