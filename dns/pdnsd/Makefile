# New ports collection makefile for:	pdnsd
# Date Created:				27 Oct 2000
# Whom:					Roman Shterenzon <roman@xpert.com>
#
# $MidnightBSD: mports/dns/pdnsd/Makefile,v 1.4 2012/09/08 21:23:11 laffer1 Exp $
# $FreeBSD: ports/dns/pdnsd/Makefile,v 1.22 2007/09/08 14:55:27 gabor Exp $
#

PORTNAME=	pdnsd
PORTVERSION=	1.2.9a
CATEGORIES=	dns ipv6
MASTER_SITES=	http://members.home.nl/p.a.rombouts/pdnsd/releases/ \
		http://distfiles.pirateparty.in/ashish/
DISTNAME=	${PORTNAME}-${PORTVERSION}-par

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Caching (permanently, writes to disk on exit) DNS proxy-server
LICENSE=	gpl3

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_RC_SUBR=	pdnsd
CONFIGURE_ARGS=	--with-cachedir=${PDNSDB} \
		--disable-src-addr-disc \
		--with-target=BSD

OPTIONS_DEFINE=	IPV6 DOCS

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

MAN5=		pdnsd.conf.5
MAN8=		pdnsd.8 pdnsd-ctl.8

PDNSDB=		/var/db/pdnsd
DOCSRCDIR=	${WRKSRC}/doc
DOC_FILES=	html/dl.html html/doc.html html/faq.html html/index.html
DOC_FILES+=	txt/faq.txt txt/intro.txt txt/manual.txt

CFLAGS+=	-pthread

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MIPV6}
CONFIGURE_ARGS+=	--enable-ipv6
.endif

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${DOC_FILES:S@^@${DOCSRCDIR}/@} ${DOCSDIR}
.endif
	@[ -f ${PREFIX}/etc/pdnsd.conf ] || \
		${INSTALL_DATA} ${PREFIX}/etc/pdnsd.conf.sample ${PREFIX}/etc/pdnsd.conf

.include <bsd.port.mk>
