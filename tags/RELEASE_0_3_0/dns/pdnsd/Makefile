# New ports collection makefile for:	pdnsd
# Date Created:				27 Oct 2000
# Whom:					Roman Shterenzon <roman@xpert.com>
#
# $MidnightBSD: mports/dns/pdnsd/Makefile,v 1.2 2009/03/13 03:58:50 laffer1 Exp $
# $FreeBSD: ports/dns/pdnsd/Makefile,v 1.22 2007/09/08 14:55:27 gabor Exp $
#

PORTNAME=	pdnsd
PORTVERSION=	1.2.8
CATEGORIES=	dns ipv6
MASTER_SITES=	http://www.phys.uu.nl/~rombouts/pdnsd/releases/
DISTNAME=	${PORTNAME}-${PORTVERSION}-par

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Caching (permanently, writes to disk on exit) DNS proxy-server
LICENSE=	gpl2
# part is bsd2 but that's "compatible"

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_RC_SUBR=	pdnsd
CONFIGURE_ARGS=	--with-cachedir=${PDNSDB} \
		--disable-src-addr-disc \
		--with-target=BSD

OPTIONS=	IPV6	"Enable IPv6 support"	on

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

MAN5=		pdnsd.conf.5
MAN8=		pdnsd.8 pdnsd-ctl.8

PDNSDB=		/var/db/pdnsd
DOCSRCDIR=	${WRKSRC}/doc
DOC_FILES=	html/dl.html html/doc.html html/faq.html html/index.html
DOC_FILES+=	txt/faq.txt txt/intro.txt txt/manual.txt

CFLAGS+=	${PTHREAD_LIBS}

OPTIONS=	IPV6	"IPv6 support"	on

.include <bsd.port.pre.mk>

.if defined(WITH_IPV6)
CONFIGURE_ARGS+=	--enable-ipv6
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${DOC_FILES:S@^@${DOCSRCDIR}/@} ${DOCSDIR}
.endif
	@[ -f ${PREFIX}/etc/pdnsd.conf ] || \
		${INSTALL_DATA} ${PREFIX}/etc/pdnsd.conf.sample ${PREFIX}/etc/pdnsd.conf

.include <bsd.port.post.mk>
