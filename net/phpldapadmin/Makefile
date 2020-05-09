PORTNAME=	phpldapadmin
PORTVERSION=	1.2.3
PORTEPOCH=	1
CATEGORIES=	net www
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-php5/${PORTVERSION}
DISTNAME=	${PORTNAME}-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A set of PHP-scripts to administer LDAP over the web

LICENSE=	gpl2

USE_PHP=	gettext ldap openssl pcre session xml iconv hash

NO_ARCH=      yes
NO_BUILD=     yes
CPE_VENDOR=   deon_george

.include <bsd.mport.options.mk>

GROUPS?=	${WWWGRP}
CFGDIR=		config
CFGFILE=	config.php

PLIST=		${WRKDIR}/plist
PLIST_SUB+=	PLA_GRP=${GROUPS}

SUB_LIST+=	PKGNAME=${PKGNAME}
SUB_FILES+=	pkg-message

.SILENT:

post-patch:
	cd ${WRKSRC} ;							    \
	${FIND} . ! -type d ! -name ${CFGFILE}.example ! -name .cvsignore   \
	    ! -name .gitignore | ${SORT} | ${SED} -e "s!^\.!%%WWWDIR%%!"    \
								>${PLIST} ; \
	${CAT} ${PKGDIR}/pkg-plist-chunk		       >>${PLIST} ; \
	${FIND} . -type d | ${SORT} -r | ${SED}				    \
	    -e 's!^\./${CFGDIR}$$!@dirrmtry %%WWWDIR%%/${CFGDIR}!'	    \
	    -e 's!^\.$$!@dirrmtry %%WWWDIR%%!'				    \
	    -e 's!^\.!@dirrm %%WWWDIR%%!'		       >>${PLIST}

do-install: install-app install-conf

install-app:
	cd ${WRKSRC} ;				    \
	for src in $$( ${FIND} . ! -name .cvsignore \
			 ! -name .gitignore  ) ; do \
	    dst=${WWWDIR}$${src#.} ;		    \
	    if ${TEST} -d $$src ; then		    \
		${MKDIR} $$dst ;		    \
	    else				    \
		${INSTALL_DATA} $$src $$dst ;	    \
	    fi					    \
	done

install-conf:
	cd ${WWWDIR}/${CFGDIR} ;		     \
	${CHMOD} 0640 ${CFGFILE}.example ;	     \
	${CHGRP} ${GROUPS} ${CFGFILE}.example ;	     \
	if ${TEST} ! -f ${CFGFILE} ; then	     \
	    ${CP} -p ${CFGFILE}.example ${CFGFILE} ; \
	fi

.include <bsd.port.mk>
