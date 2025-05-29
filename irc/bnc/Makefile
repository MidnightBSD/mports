PORTNAME=	bnc
PORTVERSION=	2.9.4
CATEGORIES=	irc
MASTER_SITES=	http://home.risingnet.net/download/
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple IRC relay proxy with support for virtual hosting

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

DEPRECATED=		Unmaintained without upstream distfile and WWW
EXPIRATION_DATE=	2025-05-27

GNU_CONFIGURE=	yes
DOCS=		COPYING Changelog README example.conf

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

.include <bsd.port.pre.mk>

post-patch:
	${SED} -e 's,@PREFIX@,${PREFIX},g' ${WRKSRC}/bncsetup

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/bnc ${PREFIX}/bin
	@${INSTALL_SCRIPT} ${WRKSRC}/bncchk ${PREFIX}/bin
	@${INSTALL_SCRIPT} ${WRKSRC}/bncsetup ${PREFIX}/bin
	@${INSTALL_PROGRAM} ${WRKSRC}/mkpasswd ${PREFIX}/bin
	@${INSTALL_DATA} ${WRKSRC}/example.conf ${PREFIX}/etc/bnc.conf.sample
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${DOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/

.include <bsd.port.post.mk>
