#-*- mode: makefile; tab-width: 4; -*-
# ex:ts=4
#
# $MidnightBSD: mports/Mk/bsd.apache.mk,v 1.4 2008/03/31 16:50:50 ctriv Exp $
# $FreeBSD: ports/Mk/bsd.apache.mk,v 1.12 2006/06/20 04:58:12 linimon Exp $
#
# bsd.apache.mk - Apache related macros.
# Author: Clement Laforet <clement@FreeBSD.org>
#
# Please view me with 4 column tabs!

##########################################################################
#
# Variables definition
# USE_APACHE:	Call this script. Values can be:
#		<version>:2.0/20/2.2/1.3+/2.0+/2.1+/2.2+
#		common*: common13, common20, common21 and common22
#
#
#
.if defined(APACHE_COMPAT)
USE_APACHE=yes
.endif

# Print warnings
_ERROR_MSG=	: Error from bsd.apache.mk.
APACHE_SUPPORTED_VERSION=	20 22
.if ${USE_APACHE:Mcommon*} != ""
AP_PORT_IS_SERVER=	YES
.elif ${USE_APACHE:L} == apr
APR_DEPS=			YES
.elif ${USE_APACHE:C/\.//:C/\+//:M[12][3210]} != ""
AP_PORT_IS_MODULE=	YES

#### for backward compatibility
.elif ${USE_APACHE:L} == yes
APACHE_PORT?=	www/apache20
APXS?=			${LOCALBASE}/sbin/apxs
.if !defined(APACHE_COMPAT)
BUILD_DEPENDS+=	${APXS}:${PORTSDIR}/${APACHE_PORT}
RUN_DEPENDS+=	${APXS}:${PORTSDIR}/${APACHE_PORT}
.endif
#### End of backward compatibility

.else
IGNORE=		${_ERROR_MSG} Illegal use of USE_APACHE
.endif

.if defined(AP_PORT_IS_SERVER)
# For slave ports:
.if defined(SLAVE_DESIGNED_FOR) && ${PORTVERSION} != ${SLAVE_DESIGNED_FOR}
IGNORE=	Sorry, ${SLAVENAME} and ${PORTNAME} versions are out of sync
.endif

.if defined(SLAVE_PORT_MODULES)
DEFAULT_MODULES_CATEGORIES+=	SLAVE_PORT
ALL_MODULES_CATEGORIES+=		SLAVE_PORT
.endif

# Module selection
.for category in ${DEFAULT_MODULES_CATEGORIES}
DEFAULT_MODULES+=			${${category}_MODULES}
WITH_${category}_MODULES= 	YES
.endfor

.for category in ${ALL_MODULES_CATEGORIES}
AVAILABLE_MODULES+=			${${category}_MODULES}
.endfor

# Setting "@comment " as default.
.for module in ${AVAILABLE_MODULES}
${module}_PLIST_SUB=		"@comment "
.endfor

# Configure
# dirty hacks to make sure all modules are disabled before we select them
.if ${USE_APACHE} == common20
CONFIGURE_ARGS+=	--disable-access --disable-auth \
			--disable-charset-lite --disable-include \
			--disable-log-config --disable-env --disable-setenvif \
			--disable-mime --disable-status --disable-autoindex \
			--disable-asis --disable-cgid --disable-cgi \
			--disable-negotiation --disable-dir --disable-imap \
			--disable-actions --disable-userdir --disable-alias
.elif ${USE_APACHE} == common22
CONFIGURE_ARGS+=	--disable-authn-file --disable-authn-default \
			--disable-authz-host --disable-authz-groupfile \
			--disable-authz-user --disable-authz-default \
			--disable-auth-basic --disable-charset-lite \
			--disable-include --disable-log-config --disable-env \
			--disable-setenvif --disable-mime --disable-status \
			--disable-autoindex --disable-asis --disable-cgid \
			--disable-cgi --disable-negotiation --disable-dir \
			--disable-imagemap --disable-actions --disable-userdir \
			--disable-alias --disable-filter \
			--disable-proxy --disable-proxy-connect \
			--disable-proxy-ftp --disable-proxy-http \
			--disable-proxy-ajp --disable-proxy-balancer
.endif

.if defined(WITH_MODULES)
_APACHE_MODULES+=	${WITH_MODULES}
.else
.for category in ${ALL_MODULES_CATEGORIES}
.if defined (WITHOUT_${category}_MODULES) || defined (WITH_CUSTOM_${category})
.        if defined(WITH_${category}_MODULES})
.        undef WITH_${category}_MODULES
.        endif
.    if defined (WITH_CUSTOM_${category})
_APACHE_MODULES+=	${WITH_CUSTOM_${category}}
.    endif
.elif defined(WITH_${category}_MODULES)
_APACHE_MODULES+=	${${category}_MODULES}
.endif
.endfor
.    if defined(WITH_EXTRA_MODULES)
_APACHE_MODULES+=	${WITH_EXTRA_MODULES}
.    endif
.endif

.if !defined(WITH_STATIC_APACHE)
.    if ${USE_APACHE:Mcommon2*} != ""
# FYI
#DYNAMIC_MODULES=	so
CONFIGURE_ARGS+=	--enable-so
.    endif
.else
.    if ${USE_APACHE:Mcommon2*} != ""
CONFIGURE_ARGS+=	--disable-so
.    endif
WITH_ALL_STATIC_MODULES=	YES
.endif

.if defined(WITH_SUEXEC) || defined(WITH_SUEXEC_MODULES)
.if ${USE_APACHE:Mcommon2*} != ""
_APACHE_MODULES+=		${SUEXEC_MODULES}
SUEXEC_CONFARGS=	with-suexec
.endif

# From now we're defaulting to apache 2.*
SUEXEC_DOCROOT?=		${PREFIX}/www/data
SUEXEC_USERDIR?=		public_html
SUEXEC_SAFEPATH?=		${PREFIX}/bin:${LOCALBASE}/bin:/usr/bin:/bin
SUEXEC_LOGFILE?=		/var/log/httpd-suexec.log
SUEXEC_UIDMIN?=			1000
SUEXEC_GIDMIN?=			1000
SUEXEC_CALLER?=			${WWWOWN}
CONFIGURE_ARGS+=		--${SUEXEC_CONFARGS}-caller=${SUEXEC_CALLER} \
				--${SUEXEC_CONFARGS}-uidmin=${SUEXEC_UIDMIN} \
				--${SUEXEC_CONFARGS}-gidmin=${SUEXEC_GIDMIN} \
				--${SUEXEC_CONFARGS}-userdir="${SUEXEC_USERDIR}" \
				--${SUEXEC_CONFARGS}-docroot="${SUEXEC_DOCROOT}" \
				--${SUEXEC_CONFARGS}-safepath="${SUEXEC_SAFEPATH}" \
				--${SUEXEC_CONFARGS}-logfile="${SUEXEC_LOGFILE}"
.if ${USE_APACHE:Mcommon2*} != ""
CONFIGURE_ARGS+=	--${SUEXEC_CONFARGS}-bin="${PREFIX}/sbin/suexec"
.endif

.   if defined(WITH_SUEXEC_UMASK)
CONFIGURE_ARGS+=		--${SUEXEC_CONFARGS}-umask=${WITH_SUEXEC_UMASK}
.   endif
.endif

.if !defined(WITHOUT_MODULES)
APACHE_MODULES=		${_APACHE_MODULES}
.else
APACHE_MODULES!=	\
			for module in ${_APACHE_MODULES}; do \
				${ECHO_CMD} ${WITHOUT_MODULES} | ${GREP} -wq $${module} 2> /dev/null || \
				${ECHO_CMD} $${module}; \
			done
.endif

.if defined(WITH_STATIC_MODULES)
STATIC_MODULE_CONFARG=	--enable-$${module}
DSO_MODULE_CONFARG=		--enable-$${module}=shared
_CONFIGURE_ARGS!=	\
			for module in ${APACHE_MODULES} ; do \
				${ECHO_CMD} ${WITH_STATIC_MODULES} | \
					${GREP} -wq $${module} 2> /dev/null ; \
				if [ "$${?}" = "0" ] ; then \
						${ECHO_CMD} "${STATIC_MODULE_CONFARG}"; \
					else \
						${ECHO_CMD} "${DSO_MODULE_CONFARG}"; \
					fi; done
CONFIGURE_ARGS+=	${_CONFIGURE_ARGS}
.elif defined(WITH_STATIC_APACHE) || defined(WITH_ALL_STATIC_MODULES)
WITH_STATIC_MODULES=	${APACHE_MODULES}
CONFIGURE_ARGS+=	--enable-modules="${APACHE_MODULES}"
.else
CONFIGURE_ARGS+=	--enable-mods-shared="${APACHE_MODULES}"
.endif

.if defined(WITH_STATIC_MODULES)
_SHARED_MODULES!=	\
			for module in ${APACHE_MODULES} ; do \
				${ECHO_CMD} ${WITH_STATIC_MODULES} | ${GREP} -wq $${module} 2> /dev/null || \
				${ECHO_CMD} $${module}; \
			done
SHARED_MODULES=		${_SHARED_MODULES}
.elif !defined(WITH_ALL_STATIC_MODULES)
SHARED_MODULES=		${APACHE_MODULES}
.endif

.  for module in ${SHARED_MODULES}
${module}_PLIST_SUB=	""
.  endfor

.for module in ${AVAILABLE_MODULES}
PLIST_SUB+=	MOD_${module:U}=${${module}_PLIST_SUB}
.endfor
####End of PORT_IS_SERVER ####

.elif defined(APR_DEPS)
IGNORE=		${_ERROR_MSG} apr support is not yet implemented

.elif defined(AP_PORT_IS_MODULE)
AP_VERSION=	${USE_APACHE:C/\.//}

APXS?=		${LOCALBASE}/sbin/apxs
HTTPD?=		${LOCALBASE}/sbin/httpd

MODULENAME?=	${PORTNAME}
SHORTMODNAME?=	${MODULENAME:S/mod_//}
SRC_FILE?=	${MODULENAME}.c
OVERRIDABLE_VARS=	SRC_FILE MODULENAME SHORTMODNAME WRKSRC \
					PKGNAMESUFFIX

.if exists(${HTTPD}) && !defined(PACKAGE_BUILDING)
AP_CUR_VERSION!=	${HTTPD} -V | ${SED} -ne 's/^Server version: Apache\/\([0-9]\)\.\([0-9]*\).*/\1\2/p'
.   if ${AP_CUR_VERSION} > 13
APACHE_MPM!=		${APXS} -q MPM_NAME
.   endif 	
.elif defined(APACHE_PORT)
AP_CUR_VERSION!=	${ECHO_CMD} ${APACHE_PORT} | ${SED} -ne 's,.*/apache\([0-9]*\).*,\1,p'
.endif

.if defined(AP_CUR_VERSION)
VERSION_CHECK!=		eval `${ECHO_CMD} "[ ${AP_VERSION} -eq ${AP_CUR_VERSION} ]" | ${SED} -e 's/- -eq/ -ge/ ; s/+ -eq/ -le/' ` ; ${ECHO_CMD} $${?}
.   if ${VERSION_CHECK} == 1
IGNORE=		${_ERROR_MSG} apache${AP_CUR_VERSION} is installed (or APACHE_PORT is defined) and port requires ${USE_APACHE}
.   endif
APACHE_VERSION=	${AP_CUR_VERSION}
.else
AP_CUR_VERSION=	none
.   if !defined(APACHE_PORT)
#Fallback to smallest version...
APACHE_VERSION=	${AP_VERSION:C/\+//}
.   endif
.endif

.if exists(${APXS}) && !defined(PACKAGE_BUILDING)
APXS_PREFIX!=	${APXS} -q prefix 2> /dev/null || echo NULL
.   if ${APXS_PREFIX} == NULL
IGNORE=	: Your apache does not support DSO modules
.   endif
.   if defined(AP_GENPLIST) && ${APXS_PREFIX} != ${PREFIX}
IGNORE?=	PREFIX must be equal to APXS_PREFIX.
.   endif
.endif

.if ${APACHE_VERSION} == 20
AP_BUILDEXT=	la
APACHEMODDIR=	libexec/apache2
APACHEINCLUDEDIR=include/apache2
APACHEETCDIR=	etc/apache2
APACHE_PORT?=	www/apache${APACHE_VERSION}
.else
AP_BUILDEXT=	la
APACHEMODDIR=	libexec/apache${APACHE_VERSION}
APACHEINCLUDEDIR=include/apache${APACHE_VERSION}
APACHEETCDIR=	etc/apache${APACHE_VERSION}
APACHE_PORT?=	www/apache${APACHE_VERSION}
.endif

PLIST_SUB+=	APACHEMODDIR="${APACHEMODDIR}" \
		APACHEINCLUDEDIR="${APACHEINCLUDEDIR}" \
		APACHEETCDIR="${APACHEETCDIR}"

.for VAR in ${OVERRIDABLE_VARS}
.  if defined(AP${APACHE_VERSION}_${VAR})
${VAR} =${AP${APACHE_VERSION}_${VAR}}
.  endif
.endfor

BUILD_DEPENDS+=	${APXS}:${PORTSDIR}/${APACHE_PORT}
RUN_DEPENDS+=	${APXS}:${PORTSDIR}/${APACHE_PORT}
PLIST_SUB+=	AP_NAME="${SHORTMODNAME}"
PLIST_SUB+=	AP_MODULE="${MODULENAME}.so"

.if defined(AP_GENPLIST)
PLIST?=		${WRKDIR}/ap-plist
.endif

.if defined(AP_INC)
AP_EXTRAS+=	-I ${AP_INC}
.endif
.if defined(AP_LIB)
AP_EXTRAS+=	-L ${AP_LIB}
.endif

.endif

.if defined(AP_PORT_IS_SERVER)
.if !target(print-closest-mirrors)
print-closest-mirrors:
	@${ECHO_MSG} -n "Fetching list of nearest mirror: " >&2
	@MIRRORS=`${FETCH_CMD} -T 30 -qo - http://www.apache.org/dyn/closer.cgi/httpd/ 2> /dev/null\
	| ${GREP} /httpd/ | ${SED} 's/.*href="\(.*\)"><str.*/\1/g' | \
	${HEAD} -7 | ${TAIL} -6` ; \
	${ECHO_MSG} done >&2; if [ "x$$MIRRORS" != "x" ]; then \
	${ECHO_MSG} -n "MASTER_SITE_APACHE_HTTPD?= ";\
	${ECHO_MSG} $$MIRRORS; else \
	${ECHO_MSG} "No mirrors found!">&2 ; fi
.endif

.if !target(show-categories)
show-categories:
.for category in ${ALL_MODULES_CATEGORIES}
	@${ECHO_MSG} "${category} contains these modules:"
	@${ECHO_MSG} "  ${${category}_MODULES}"
.endfor
.endif

.if !target(show-modules)
show-modules:
	@for module in ${AVAILABLE_MODULES} ; do \
	${ECHO_MSG} -n "$${module}: "; \
	if ${ECHO_CMD} ${APACHE_MODULES} | ${GREP} -wq $${module} 2> /dev/null ; \
	then \
		${ECHO_CMD} -n "enabled "; \
			if ${ECHO_CMD} ${WITH_STATIC_MODULES} | ${GREP} -wq $${module} 2> /dev/null ; then \
				${ECHO_CMD} "(static)" ; \
			else \
				${ECHO_CMD} "(shared)" ;\
			fi;\
	else \
		${ECHO_CMD} disabled ;\
	fi;\
	done
.endif

.elif defined(AP_PORT_IS_MODULE)

.if defined(AP_FAST_BUILD)
.if !target(ap-gen-plist)
ap-gen-plist:
.if defined(AP_GENPLIST)
.   if !exists(${PLIST})
	@${ECHO} "===>  Generating apache plist"
	@${ECHO} "@unexec %D/sbin/apxs -e -A -n %%AP_NAME%% %D/%%APACHEMODDIR%%/%%AP_MODULE%%" > ${PLIST}
	@${ECHO} "%%APACHEMODDIR%%/%%AP_MODULE%%" >> ${PLIST}
	@${ECHO} "@exec %D/sbin/apxs -e -A -n %%AP_NAME%% %D/%F" >> ${PLIST}
	@${ECHO} "@unexec echo \"Don't forget to remove all ${MODULENAME}-related directives in your httpd.conf\"">> ${PLIST}
.   endif
.else
	@${DO_NADA}
.endif
.endif

.if !target(do-build)
do-build: ap-gen-plist
	@cd ${WRKSRC} && ${APXS} -c ${AP_EXTRAS} -o ${MODULENAME}.${AP_BUILDEXT} ${SRC_FILE}
.endif

.if !target(do-install)
do-install:
	@${APXS} -i -A -n ${SHORTMODNAME} ${WRKSRC}/${MODULENAME}.${AP_BUILDEXT}
.endif

.endif

.endif
