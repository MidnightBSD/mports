PORTNAME=	netbeans
PORTVERSION=	8.0.2
PORTREVISION=	2
CATEGORIES=	java devel
MASTER_SITES=	http://download.netbeans.org/netbeans/${PORTVERSION}/final/zip/ \
    		http://dlc.sun.com.edgesuite.net/netbeans/${PORTVERSION}/final/zip/
DISTNAME=	netbeans-${PORTVERSION}-201411181905
PKGNAMESUFFIX=	8

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A full-featured integrated environment for Java

LICENSE=	cddl gpl2
LICENSE_COMB=	dual

USES=		java shebangfix zip
SHEBANG_FILES=	extide/ant/bin/antRun.pl \
		extide/ant/bin/complete-ant-cmd.pl \
		extide/ant/bin/runant.pl \
		extide/ant/bin/runant.py
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/netbeans
DATADIR=	${PREFIX}/${PORTNAME}-${PORTVERSION}

PLIST_SUB+=	PORTVERSION=${PORTVERSION}

DESKTOP_ENTRIES="NetBeans" \
		"NetBeans IDE" \
		${DATADIR}/nb/netbeans.png \
		${PORTNAME}-${PORTVERSION} \
		"Development;" \
		false

post-patch:
	@${REINPLACE_CMD} -i "" -e '57s|#||;57s|/path/to/jdk|${JAVA_HOME}|' \
	    ${WRKSRC}/etc/netbeans.conf
	@${FIND} ${WRKSRC} -name "*.orig" -delete

do-install:
	cd ${WRKSRC} && ${COPYTREE_SHARE} \* ${DATADIR}
	${CHMOD} ${BINMODE} ${STAGEDIR}${DATADIR}/bin/netbeans
	${LN} -sf ${DATADIR}/bin/netbeans ${STAGEDIR}${PREFIX}/bin/${PORTNAME}-${PORTVERSION}

post-install:
	${FIND} ${STAGEDIR}${DATADIR} -type f -ipath "*/bin/*" | ${XARGS} ${CHMOD} ${BINMODE}

.include <bsd.port.mk>
