# $MidnightBSD: mports/security/linux-pam-docs/Makefile,v 1.4 2008/04/01 05:02:43 laffer1 Exp $
# $FreeBSD: ports/security/linux-pam-docs/Makefile,v 1.1 2003/10/10 06:06:13 edwin Exp $

PORTNAME=	linux-pam-docs
PORTVERSION=	1.1.3
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_KERNEL_ORG}
MASTER_SITE_SUBDIR=	linux/libs/pam/documentation/
DISTNAME=	Linux-PAM-${PORTVERSION}-docs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux-PAM offline documentation
LICENSE=	unknown

WRKSRC=		${WRKDIR}/Linux-PAM-${PORTVERSION}
NO_BUILD=	yes

.if defined(NOPORTDOCS)
IGNORE=		can't be installed when NOPORTDOCS is defined
.endif

do-install:
	${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC}/doc/ && ${COPYTREE_SHARE} . ${DOCSDIR})

.include <bsd.port.mk>
