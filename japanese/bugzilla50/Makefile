PORTNAME=	bugzilla
PORTVERSION=	5.0.2
CATEGORIES=	japanese
MASTER_SITES=	http://bug-ja.org/releases/5.0/ \
		FREEBSD_LOCAL/tota/bugzilla-ja
DISTNAME=	Bugzilla-ja-${PORTVERSION}-template

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese localization for Bugzilla
WWW=		http://bug-ja.org/

RUN_DEPENDS=	bugzilla50>=${PORTVERSION}:devel/bugzilla50

NO_WRKSUBDIR=	yes

.include "${.CURDIR}/../../devel/bugzilla50/Makefile.common"

USES=		cpe tar:bzip2
CPE_VENDOR=	mozilla

LANGDIR=	${WWWDIR}/template/ja

do-install:
	@-${MKDIR} ${STAGEDIR}${LANGDIR}/default
	(cd ${WRKSRC}/default && ${COPYTREE_SHARE} . ${STAGEDIR}${LANGDIR}/default)

# Maintainer
plist: patch
	@( cd ${WRKSRC}/ && ${FIND} default -type f | ${AWK} '{print "%%WWWDIR%%/template/ja/"$$1}' | ${SORT} > ${PLIST}.new )
	@if ${DIFF} -u ${PLIST} ${PLIST}.new ; then \
		${ECHO_MSG} no pkg-plist changes; \
		${RM} ${PLIST}.new ; \
	fi

.include <bsd.port.mk>
