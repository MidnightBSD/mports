# $MidnightBSD: mports/net-mgmt/p5-Altoids/Makefile,v 1.2 2007/06/06 18:40:31 ctriv Exp $

PORTNAME=	Altoids
PORTVERSION=	1.017
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	http://dave.plonka.us/Altoids/%SUBDIR%/
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SNMP get/walk functionality with built-in name to OID translation
LICENSE=	gpl2

USE_PERL5=	yes

BUILD_DEPENDS=	${SITE_PERL}/SNMP_Session.pm:${PORTSDIR}/net-mgmt/p5-SNMP_Session
RUN_DEPENDS=	${BUILD_DEPENDS}

GNU_CONFIGURE=	yes

CONFIGURE_ARGS+=	--with-perllib=${SITE_PERL} \
			--with-oids=${LOCALBASE}/share/${PORTNAME:L}

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
