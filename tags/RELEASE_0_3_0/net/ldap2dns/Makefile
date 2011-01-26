# New ports collection makefile for:	ldap2dns
# Date created:				May 30, 2008
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	ldap2dns
PORTVERSION=	0.4.1
CATEGORIES=	net
MASTER_SITES=	http://projects.alkaloid.net/e107_files/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Maintain DNS zones using an LDAP directory
LICENSE=	gpl2

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Net/DNS.pm:${PORTSDIR}/dns/p5-Net-DNS \
		${SITE_PERL}/Net/LDAP.pm:${PORTSDIR}/net/p5-perl-ldap

USE_GMAKE=	yes
USE_OPENLDAP=	yes
USE_PERL5=	yes

MAKE_ENV=	PREFIX=${PREFIX} INC=-I${PREFIX}/include LIB=-L${PREFIX}/lib

post-patch:
	@${REINPLACE_CMD} -e "s,%%PREFIX%%,${PREFIX}," ${WRKSRC}/ldap2dns.c
	@${REINPLACE_CMD} -e "s,%%PREFIX%%,${PREFIX}," ${WRKSRC}/ldap2tinydns-conf

do-install:
	${MKDIR} ${DATADIR}
	${INSTALL_SCRIPT} ${WRKSRC}/ldap2dns ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/ldap2dnsd ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/ldap2dns.schema ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/doc/example.ldif ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/doc/README.html ${DATADIR}
	${INSTALL_SCRIPT} ${WRKSRC}/ldap2tinydns-conf ${DATADIR}
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/axfr2ldap.pl ${DATADIR}
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/data2ldif.pl ${DATADIR}

.include <bsd.port.mk>
