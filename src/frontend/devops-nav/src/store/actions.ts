import { ActionTree, ActionContext } from 'vuex'
import { AxiosRequestConfig } from 'axios'
import Request from '../utils/request'
import { transformObj } from '../utils/util'
import {
    SET_USER_INFO,
    SET_PROJECT_LIST,
    FETCH_ERROR,
    SET_LINKS,
    SET_DEMO_PROJECT,
    SET_DEMO_PIPELINE_ID,
    UPDATE_NEW_PROJECT,
    TOGGLE_PROJECT_DIALOG,
    BACKEND_API_URL_PREFIX,
    PROCESS_API_URL_PREFIX,
    PROJECT_API_URL_PREFIX,
    EMPTY_PROJECT,
    RESET_NEW_PROJECT,
    SET_POPUP_SHOW,
    UPDATE_HEADER_CONFIG,
    CLOSE_PREVIEW_TIPS,
    TOGGLE_MODULE_LOADING,
    UPDATE_CURRENT_PAGE,
    SET_SERVICES,
    TOGGLE_PERMISSION_DIALOG,
    TOGGLE_NOTICE_DIALOG,
    SET_CURRENT_NOTICE,
    AUTH_API_URL_PREFIX
} from './constants'

const actions: ActionTree<RootState, any> = {
    togglePermissionDialog ({ commit }: ActionContext<RootState, any>, visible: boolean) {
        commit(TOGGLE_PERMISSION_DIALOG, visible)
    },
    updateCurrentPage ({ commit }: ActionContext<RootState, any>, page: object) {
        commit(UPDATE_CURRENT_PAGE, page)
    },
    toggleModuleLoading ({ commit }: ActionContext<RootState, any>, moduleLoading: boolean) {
        commit(TOGGLE_MODULE_LOADING, moduleLoading)
    },
    upadteHeaderConfig ({ commit }: ActionContext<RootState, any>, headerConfig: object) {
        commit(UPDATE_HEADER_CONFIG, headerConfig)
    },
    setUserInfo ({ commit }: ActionContext<RootState, any>, user: User) {
        commit(SET_USER_INFO, { user: transformObj(user) })
    },
    async toggleServiceCollect (_, { serviceId, isCollected }: any) {
        return Request.put(`${PROJECT_API_URL_PREFIX}/user/services/${serviceId}?collector=${isCollected}`)
    },
    async fetchLinks ({ commit }, { type }) {
        try {
            const links = await Request.get(`${PROJECT_API_URL_PREFIX}/user/activities/types/${type}`)
            commit(SET_LINKS, {
                links,
                type
            })
        } catch (e) {
            commit(FETCH_ERROR, e)
        }
    },
    createDemo (_, payload) {
        return Request.post(`${PROCESS_API_URL_PREFIX}/user/accesses/`, payload)
    },
    setProjectList ({ commit }: ActionContext<RootState, any>, projectList: object) {
        commit(SET_PROJECT_LIST, { projectList })
    },
    setServices ({ commit }: ActionContext<RootState, any>, services: object[]) {
        console.log(services)
        commit(SET_SERVICES, { services })
    },
    async getProjects ({ dispatch }: ActionContext<RootState, any>) {
        const res: any = await Request.get(`${PROJECT_API_URL_PREFIX}/user/projects/`)
        const projectList: Project[] = res
        if (Array.isArray(projectList)) {
            dispatch('setProjectList', projectList)
            window.setLsCacheItem('projectList', projectList.filter((project: Project) => project.enabled))
        }
    },
    ajaxUpdatePM (_, { projectCode, data }) {
        return Request.put(
            `${PROJECT_API_URL_PREFIX}/user/projects/${projectCode}/`,
            data,
            { headers: { 'X-DEVOPS-PROJECT-ID': projectCode, 'Content-Type': 'application/json' } }
        )
    },
    ajaxAddPM (_, data) {
        return Request.post(`${PROJECT_API_URL_PREFIX}/user/projects/`, data)
    },
    toggleProjectEnable (_, { projectCode, enabled }) {
        return Request.put(
            `${PROJECT_API_URL_PREFIX}/user/projects/${projectCode}/enable?enabled=${enabled}`,
            null,
            { headers: { 'X-DEVOPS-PROJECT-ID': projectCode, 'Content-Type': 'application/json' } }
        )
    },
    selectDemoProject ({ commit }, { project }) {
        commit(SET_DEMO_PROJECT, {
            project
        })
    },
    setDemoPipelineId ({ commit }, { pipelineId }) {
        commit(SET_DEMO_PIPELINE_ID, {
            pipelineId
        })
    },
    updateNewProject ({ commit }, payload) {
        commit(UPDATE_NEW_PROJECT, payload)
    },
    resetNewProject ({ commit }, project = EMPTY_PROJECT) {
        commit(RESET_NEW_PROJECT, project)
    },
    toggleProjectDialog ({ commit }, payload) {
        commit(RESET_NEW_PROJECT, payload.project || EMPTY_PROJECT)
        commit(TOGGLE_PROJECT_DIALOG, payload)
        if (payload.project) {
            commit(UPDATE_NEW_PROJECT, payload.project)
        }
    },
    togglePopupShow ({ commit }, payload) {
        commit(SET_POPUP_SHOW, payload)
    },
    getDocList () {
        return Request.get(`${BACKEND_API_URL_PREFIX}/ci/docs/?format=json`)
    },
    changeProjectLogo (_, { projectCode, formData }) {
        return Request.put(`${PROJECT_API_URL_PREFIX}/user/projects/${projectCode}/logo/`, formData)
    },
    closePreviewTips ({ commit }: ActionContext<RootState, RootState>) {
        commit(CLOSE_PREVIEW_TIPS)
    },
    toggleNoticeDialog ({ commit }, payload) {
        commit(TOGGLE_NOTICE_DIALOG, payload)
    },
    getAnnouncement () {
        return Request.get(`${PROJECT_API_URL_PREFIX}/user/notice/valid`)
    },
    setAnnouncement ({ commit }, payload) {
        commit(SET_CURRENT_NOTICE, payload)
    },
    getPermRedirectUrl (_, payload) {
        return Request.post(`${AUTH_API_URL_PREFIX}/user/auth/permissionUrl`, payload)
    },
    hasCreateProjectPermission () {
        return Request.get(`${PROJECT_API_URL_PREFIX}/user/projects/hasCreatePermission`)
    },
    /**
     * 项目列表 (项目管理界面)
     */
    fetchProjectList (_, payload = {
        sortType: '',
        collation: ''
    }) {
        const { sortType, collation } = payload
        return Request.get(`${PROJECT_API_URL_PREFIX}/user/projects?unApproved=true&sortType=${sortType}&collation=${collation}`)
    },
    /**
     * 申请加入项目
     */
    applyToJoinProject (_, payload) {
        const { englishName, ApplicationInfo } = payload
        return Request.post(`${PROJECT_API_URL_PREFIX}/user/auth/apply/${englishName}/applyToJoinProject/`, ApplicationInfo)
    },
    /**
     * 项目列表 (申请加入项目弹窗，分页加载)
     */
    fetchWithoutPermissionsProjects (_, payload) {
        const { pageSize, page, projectName } = payload
        return Request.get(`${PROJECT_API_URL_PREFIX}/user/projects/listProjectsWithoutPermissions?page=${page}&pageSize=${pageSize}&projectName=${projectName}`)
    },

    fetchVersionsLogList () {
        return Request.get(`${window.location.origin}/bundledVersionLog.json?t=${Date.now()}`, {
            originalResponse: true
        } as AxiosRequestConfig & { originalResponse: boolean })
    },

    fetchVersionsLogListEn () {
        return Request.get(`${window.location.origin}/bundledVersionLog_en.json?t=${Date.now()}`, {
            originalResponse: true
        } as AxiosRequestConfig & { originalResponse: boolean })
    },
    /**
     * 人员列表 (项目管理退出项目弹窗移交人员列表)
     */
    getProjectMembers (_, { projectId, params }) {
        const query = new URLSearchParams({
            ...params
        }).toString()
        return Request.get(`${AUTH_API_URL_PREFIX}/user/auth/resource/member/${projectId}/listProjectMembers?${query}`)
    },
    /**
     * 用户主动退出项目检查
     */
    checkMemberExitsProject (_, { projectId }) {
        return Request.get(`${AUTH_API_URL_PREFIX}/user/auth/resource/member/${projectId}/checkMemberExitsProject`)
    },
    /**
     * 用户主动退出项目
     */
    memberExitsProject (_, { projectId, handoverParams }) {
        return Request.post(`${AUTH_API_URL_PREFIX}/user/auth/resource/member/${projectId}/memberExitsProject`, handoverParams)
    }
}

export default actions
