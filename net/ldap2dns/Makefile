PORTNAME=	ldap2dns
PORTVERSION=	0.4.2
CATEGORIES=	net
MASTER_SITES=	GHC

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Maintain DNS zones using an LDAP directory

LICENSE=	gpl2

RUN_DEPENDS=	p5-Net-DNS>=0:dns/p5-Net-DNS \
		p5-perl-ldap>=0:net/p5-perl-ldap

WRKSRC=		${WRKDIR}/${DISTNAME}

USES=		gmake ldap localbase:ldflags perl5 
USE_OPENLDAP=	yes
USE_PERL5=	run
MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}" LD="${CC}" LDFLAGS="${LDFLAGS}"

USE_GITHUB=	yes
GH_ACCOUNT=	bklang

post-patch:
	@${REINPLACE_CMD} 's|?=|=|' ${WRKSRC}/Makefile
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
