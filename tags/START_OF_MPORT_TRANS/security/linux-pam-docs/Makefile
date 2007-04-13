# New ports collection makefile for: Linux-PAM offline documentation
# Date created:		19 Jun 2003
# Whom:			Hideyuki KURASHINA <rushani@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/security/linux-pam-docs/Makefile,v 1.1 2003/10/10 06:06:13 edwin Exp $
#

PORTNAME=	linux-pam-docs
PORTVERSION=	0.76
CATEGORIES=	security
MASTER_SITES=	http://www.kernel.org/pub/linux/libs/pam/pre/doc/
DISTNAME=	Linux-PAM-${PORTVERSION}-docs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux-PAM offline documentation

NO_WRKSUBDIR=	yes
NO_BUILD=	yes
CPIO=		cpio --quiet -pdum -R

do-install:
	@ ${MKDIR} ${DOCSDIR}
	@ cd ${WRKSRC} && ${FIND} * \
	  | ${CPIO} ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}

.include <bsd.port.mk>
