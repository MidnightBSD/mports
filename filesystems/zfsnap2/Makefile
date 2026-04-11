PORTNAME=	zfsnap
DISTVERSIONPREFIX=	v
DISTVERSION=	2.0.0-beta3
CATEGORIES=	filesystems sysutils
PKGNAMESUFFIX=	2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable performant script to make rolling ZFS snapshots easy
WWW=		https://github.com/zfsnap/zfsnap

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_BUILD=	yes
USE_GITHUB=	yes

OPTIONS_DEFINE=		BASH ZSH DOCS
OPTIONS_DEFAULT=	BASH ZSH
OPTIONS_SUB=	yes

PORTDOCS=	AUTHORS NEWS PORTABILITY README.md

PERIODICDIR?=	${PREFIX}/etc/periodic

post-patch:
	@${REINPLACE_CMD} -e "s,# ZFSNAP_LIB_DIR=.*,ZFSNAP_LIB_DIR=${PREFIX}/share/zfsnap,g" ${WRKSRC}/sbin/zfsnap.sh
.for period in daily weekly monthly
	@${SED} -e "s/xPERIODICx/${period}/g" -e "s#xPREFIXx#${PREFIX}/sbin#g" ${WRKSRC}/periodic/xPERIODICx_zfsnap.sh > ${WRKSRC}/periodic/${period}_zfsnap.sh
.endfor

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/sbin/zfsnap.sh ${PREFIX}/sbin/zfsnap
	cd ${WRKSRC}/share && ${COPYTREE_SHARE} zfsnap ${PREFIX}/share/
	cd ${WRKSRC} && ${COPYTREE_SHARE} completion ${PREFIX}/share/zfsnap
.for period in daily weekly monthly
	@${MKDIR} ${PERIODICDIR}/${period}
	${INSTALL_SCRIPT} ${WRKSRC}/periodic/${period}_zfsnap.sh ${PERIODICDIR}/${period}/402.zfsnap
.endfor
	${INSTALL_MAN} ${WRKSRC}/man/man8/zfsnap.8 ${PREFIX}/share/man/man8/zfsnap.8
	${MKDIR} ${DOCSDIR}
.for file in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}/${file}
.endfor

post-install-BASH-on:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/etc/bash_completion.d
	${LN} -s ../../share/zfsnap/completion/zfsnap-completion.bash \
		${FAKE_DESTDIR}${PREFIX}/etc/bash_completion.d/zfsnap.sh

post-install-ZSH-on:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/zsh/site-functions
	${LN} -s ../../zfsnap/completion/zfsnap-completion.zsh \
		${FAKE_DESTDIR}${PREFIX}/share/zsh/site-functions/_zfsnap

.include <bsd.port.mk>
