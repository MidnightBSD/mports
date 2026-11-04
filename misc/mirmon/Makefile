PORTNAME=	mirmon
PORTVERSION=	2.11
CATEGORIES=	misc
MASTER_SITES=	http://www.staff.science.uu.nl/~penni101/mirmon/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monitor the status of mirrors
WWW=		http://www.cs.uu.nl/people/henkp/mirmon/

LICENSE=	other
#bsdish

RUN_DEPENDS=	wget:ftp/wget

NO_BUILD=	yes
USES=		perl5 shebangfix
USE_PERL5=	run

SHEBANG_FILES=	${WRKSRC}/mirmon ${WRKSRC}/probe

SUB_FILES=	pkg-message
SUB_LIST=	PREFIX=${PREFIX}

PLIST_FILES=	bin/mirmon bin/probe share/man/man1/mirmon.1.gz

.include <bsd.mport.options.mk>

OPTIONS_DEFINE=	DOCS

.if ! ${PORT_OPTIONS:MDOCS}
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
	${INSTALL_MAN} ${WRKSRC}/mirmon.1 ${PREFIX}/share/man/man1
.if ! ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	${CP} ${WRKSRC}/mirmon.html ${DOCSDIR}
.endif

.include <bsd.port.mk>
