# $MidnightBSD: mports/misc/mirmon/Makefile,v 1.5 2011/05/14 22:26:48 laffer1 Exp $

PORTNAME=	mirmon
PORTVERSION=	2.6
CATEGORIES=	misc
MASTER_SITES=	http://www.staff.science.uu.nl/~penni101/mirmon/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monitor the status of mirrors
LICENSE=	other
#bsdish

RUN_DEPENDS=	wget:${PORTSDIR}/ftp/wget

NO_BUILD=	yes
USE_PERL5_RUN=	yes

SUB_FILES=	pkg-message
SUB_LIST=	PREFIX=${PREFIX}

PLIST_FILES=	bin/mirmon bin/probe
MAN1=		mirmon.1

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

post-patch:
	@${REINPLACE_CMD} -e "s,/etc,${LOCALBASE}/etc," \
		${WRKSRC}/mirmon ${WRKSRC}/mirmon.html ${WRKSRC}/probe
	@${REINPLACE_CMD} -e "s,/usr/bin/wget,${LOCALBASE}/bin/wget," \
		-e "s,/usr/bin/rsync,${LOCALBASE}/bin/rsync," ${WRKSRC}/probe

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/mirmon ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/probe ${PREFIX}/bin
	@${MKDIR} ${DATADIR}
	${CP} -R ${WRKSRC}/countries.list ${WRKSRC}/icons ${DATADIR}
	@${FIND} ${DATADIR} ! -type d | \
		${SED} 's,^${PREFIX}/,,' >> ${TMPPLIST}
	@${FIND} ${DATADIR} -type d | ${SORT} -r | \
		${SED} 's,^${PREFIX}/,@dirrm ,' >> ${TMPPLIST}
	${INSTALL_MAN} ${WRKSRC}/mirmon.1 ${MANPREFIX}/man/man1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${CP} ${WRKSRC}/mirmon.html ${DOCSDIR}
.endif

.include <bsd.port.mk>
