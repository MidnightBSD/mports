#
# $MidnightBSD$
#
# update.mk
#
# Targets for updating a port and its upwards depends.
#

check-for-older-installed: 
	@${MPORT_CHECK_OLDER} -o ${PKGORIGIN} -v ${PKGVERSION}


update-upwards-depends:
	@for updep in `${MPORT_UPDEPENDS} -o ${PKGORIGIN}`; do \
		if [ -d ${PORTSDIR}/$$updep ]; then \
			cd ${PORTSDIR}/$$updep && ${SETENV} DOWN_DEPEND=${PKGORIGIN} ${MAKE} soft-update; \
		else \
			echo "No such port: $$updep"; \
			exit 1; \
		fi \
	done

do-update:
	@${MPORT_UPDATE} ${PKGFILE}


soft-update:
	@if ${MPORT_CHECK_OLDER} -o ${PKGORIGIN} -v ${PKGVERSION} >/dev/null; then \
		cd ${.CURDIR} && exec ${MAKE} update; \
	else \
		if echo "${LIB_DEPENDS}" | grep ${DOWN_DEPEND} >/dev/null; then \
			cd ${.CURDIR} && exec ${MAKE} rebuild-and-reinstall; \
		else \
			${TRUE}; \
		fi; \
	fi


rebuild-and-reinstall:
	@cd ${.CURDIR} && exec ${MAKE} NOCLEANDEPENDS=1 clean
	@cd ${.CURDIR} && exec ${MAKE} package
	@cd ${.CURDIR} && exec ${MAKE} deinstall
	@cd ${.CURDIR} && exec ${MAKE} install

upward-depends-list:
	@${MPORT_UPDEPENDS} -o ${PKGORIGIN}			
